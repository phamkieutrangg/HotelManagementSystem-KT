/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.RoomEntity;
import com.ivt.jv44_final.repository.RoomRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class RoomService {
    
    @Autowired
    private RoomRepository roomRepository;
    
    public List<RoomEntity> getRooms(){
        return (List<RoomEntity>) roomRepository.findAll();
    }
    
    public void saveRoom(RoomEntity room) {
       roomRepository.save(room);
    }
    public RoomEntity getRoom(int id){
        Optional<RoomEntity> roomOtional = roomRepository.findById(id);
        if(roomOtional.isPresent()){
            return roomOtional.get();
        }
        return new RoomEntity();
    }
}
