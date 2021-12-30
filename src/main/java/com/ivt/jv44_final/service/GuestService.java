/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.GuestEntity;
import com.ivt.jv44_final.repository.GuestRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class GuestService {

    @Autowired
    private GuestRepository guestRepository;

    public void saveGuest(GuestEntity guest) {
        guestRepository.save(guest);
    }

    public List<GuestEntity> findServiceBookingByBookingDetailId(int id) {
        return guestRepository.findByBookingDetail_Id(id);
    }

    public GuestEntity getGuest(int id) {
        Optional<GuestEntity> opGuest = guestRepository.findById(id);
        if (opGuest.isPresent()) {
            return opGuest.get();
        }
        return new GuestEntity();
    }

    public void deleteGuest(int guestId) {
          guestRepository.deleteByGuestId(guestId);
    }
    
}
