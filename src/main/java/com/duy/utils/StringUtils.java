package com.duy.utils;

public class StringUtils {
	

	public static boolean isNullOrEmpty(String test) {
		if(test != null && test != "") {
			return false;
		}
		return true;
	}

}
