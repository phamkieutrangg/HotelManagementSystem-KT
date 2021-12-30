/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.UserEntity;
import com.ivt.jv44_final.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class UserService {
      @Autowired
    private UserRepository userRepository;
    
    public List<UserEntity> getUsers(){
        return (List<UserEntity>) userRepository.findAll();
    }
    
    public UserEntity getUser(int id){
        Optional<UserEntity> roomOtional = userRepository.findById(id);
        if(roomOtional.isPresent()){
            return roomOtional.get();
        }
        return new UserEntity();
    }
}
