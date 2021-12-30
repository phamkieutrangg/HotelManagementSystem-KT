/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.repository;


import com.ivt.jv44_final.entities.BookingEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author KT
 */
@Repository
public interface BookingRepository extends CrudRepository<BookingEntity, Integer> {

 List<BookingEntity> findByUserFullNameContaining(String name);
 
 List<BookingEntity> findByBookingDateBetween(Date date1, Date date2);
}
