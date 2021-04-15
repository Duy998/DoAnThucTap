package com.duy.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.duy.dto.PasswordDTO;
import com.duy.dto.UserDTO;
import com.duy.exception.MyException;

public interface IUserService {
  
    Map<Long, String> getStaffMaps();
    
    UserDTO findOneByUserNameAndStatus(String name, int status);
    List<UserDTO> getUsers(String searchValue, Pageable pageable);
    int getTotalItems(String searchValue);
    UserDTO findOneByUserName(String userName);
    UserDTO findUserById(long id);
    UserDTO insert(UserDTO userDTO);
    UserDTO update(Long id, UserDTO userDTO);
    void updatePassword(long id, PasswordDTO userDTO) throws MyException;
    UserDTO resetPassword(long id);
    UserDTO updateProfileOfUser(String id, UserDTO userDTO);
    void delete(long[] ids);
    Map<Long, String> findAll();
    Map<String, String> findAll1();
}
