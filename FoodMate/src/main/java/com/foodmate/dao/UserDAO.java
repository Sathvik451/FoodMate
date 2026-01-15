package com.foodmate.dao;

import java.util.List;

import com.foodmate.model.User;
public interface UserDAO {
	  int addUser(User user);
	    User getUserById(int userId);
	    User getUserByUsername(String username);
	    List<User> getAllUsers();
	    boolean updateUser(User user);
	    boolean deleteUser(int userId);
	    boolean authenticateUser(String username, String password);
	    boolean checkUsernameExists(String username);
	    boolean checkEmailExists(String email);
}
