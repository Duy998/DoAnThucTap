package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.StaffAssignmentDto;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.request.AssignCustomerRequestDto;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserConverter userConverter;

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public UserDTO findOneByUserNameAndStatus(String name, int status) {
        return userConverter.convertToDto(userRepository.findOneByUserNameAndStatus(name, status));
    }

    @Override
    public Map<Long, String> getStaffMaps() {
        Map<Long, String> result = new HashMap<>();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "USER");
        for (UserEntity item : staffs) {
            result.put(item.getId(), item.getFullName());
        }
        return result;
    }

    @Override
    public List<UserDTO> findAllByBuilding(Long buildingId) {
        List<UserEntity> users = userRepository.findAllByBuilding();
        List<UserDTO> userConverted = users.stream().map(userConverter::convertToDto).collect(Collectors.toList());

        userConverted.stream().forEach(user -> {
            if (!CollectionUtils.isEmpty(user.getBuildingIds()) && user.getBuildingIds().contains(buildingId)) {
                user.setChecked("checked");
            }
        });
        return userConverted;
    }

    @Override
    public List<UserDTO> findAllByCustomer(Long customerId) {
        List<UserEntity> usersFound = userRepository.findAllByCustomer(customerId);
        List<UserDTO> userConverted = usersFound.stream().map(userConverter::convertToDto).collect(Collectors.toList());

        userConverted.stream().forEach(user -> {
            if (!CollectionUtils.isEmpty(user.getCustomerIds()) && user.getCustomerIds().contains(customerId)) {
                user.setChecked("checked");
            }
        });
        return userConverted;
    }

    @Transactional
    @Override
    public void assginCustomer(AssignCustomerRequestDto request) {
        if (Objects.nonNull(request)) {
           CustomerEntity customerFound = customerRepository.findOne(request.getCustomerId());
           List<UserEntity> users = customerFound.getUsers();

           if (!CollectionUtils.isEmpty(users)) {
               for (UserEntity user : users) {
                   user.getCustomers().remove(customerFound);
               }
           }
           customerFound.getUsers().removeAll(users);

            List<UserEntity> userSelected = userRepository.findAll(request.getStaffIds());
            CustomerEntity customerSelected = customerRepository.findOne(request.getCustomerId());

            customerSelected.setUsers(userSelected);
            userSelected.stream().forEach(user -> user.getCustomers().add(customerSelected));

            userRepository.save(userSelected);
        }
    }
}
