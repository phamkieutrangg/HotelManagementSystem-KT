/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;


import com.ivt.jv44_final.entities.UserEntity;
import com.ivt.jv44_final.entities.UserRoleEntity;
import com.ivt.jv44_final.enums.UserStatus;
import com.ivt.jv44_final.repository.UserRepository;
import com.ivt.jv44_final.repository.UserRoleRepository;
import java.util.HashSet;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserRoleRepository userRoleRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        UserEntity user = userRepository.findByEmailLikeAndStatusLike(email, UserStatus.ACTIVE);
        if (user == null) {
            throw new UsernameNotFoundException(email);
        }
        Set<UserRoleEntity> roleNames = userRoleRepository.findByUsers_Email(email);
        Set<GrantedAuthority> grantList = new HashSet<>();
        if (!CollectionUtils.isEmpty(roleNames)) {
            for (UserRoleEntity role : roleNames) {
                GrantedAuthority authority = new SimpleGrantedAuthority(role.getRole().toString());
                grantList.add(authority);
            }
        }

        return (UserDetails) new User(user.getEmail(), user.getPassword(), grantList);
    }

}
