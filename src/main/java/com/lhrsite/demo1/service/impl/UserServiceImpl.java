package com.lhrsite.demo1.service.impl;

import com.lhrsite.demo1.entity.User;
import com.lhrsite.demo1.repository.UserRepository;
import com.lhrsite.demo1.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public List<User> getUser() {
        return userRepository.findAll();
    }

    @Override
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public void delete(Integer uid) {
        userRepository.deleteById(uid);
    }


}
