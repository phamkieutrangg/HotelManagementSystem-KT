/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.repository;

import com.ivt.jv44_final.entities.BookingDetailEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author KT
 */
@Repository
public interface BookingDetailRepository extends CrudRepository<BookingDetailEntity, Integer> {

    List<BookingDetailEntity> findByBooking_Id(int id);
    
    BookingDetailEntity findByBooking_IdAndRoom_Id(int bookingId, int roomId);

}
