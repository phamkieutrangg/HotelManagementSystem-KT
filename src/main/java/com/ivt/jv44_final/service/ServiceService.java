/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.ServiceEntity;
import com.ivt.jv44_final.repository.ServiceRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class ServiceService {

    @Autowired
    private ServiceRepository serviceRepository;

    public List<ServiceEntity> getServices() {
        return (List<ServiceEntity>) serviceRepository.findAll();
    }

    public void saveService(ServiceEntity service) {
        serviceRepository.save(service);
    }
    
    public ServiceEntity getService(int serviceId) {
        Optional<ServiceEntity> optional = serviceRepository.findById(serviceId);
       if(optional.isPresent()){
           return optional.get();
       }
       return null;
    }
    

}
