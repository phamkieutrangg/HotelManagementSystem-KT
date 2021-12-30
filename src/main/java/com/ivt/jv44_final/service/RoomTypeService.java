/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.ImageEntity;
import com.ivt.jv44_final.entities.RoomTypeEntity;
import com.ivt.jv44_final.repository.RoomTypeRepository;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KT
 */
@Service
public class RoomTypeService {
    
    @Autowired
    private RoomTypeRepository roomTypeRepository;
    
    public List<RoomTypeEntity> getRoomTypes(){
        return (List<RoomTypeEntity>) roomTypeRepository.findAll();
    }
    
    public void saveRoomType(RoomTypeEntity roomType) {
       roomTypeRepository.save(roomType);
    }
    public RoomTypeEntity getRoomType(int roomTypeId) {
       Optional<RoomTypeEntity> optional = roomTypeRepository.findById(roomTypeId);
       if(optional.isPresent()){
           return optional.get();
       }
       return null;
    }

}
