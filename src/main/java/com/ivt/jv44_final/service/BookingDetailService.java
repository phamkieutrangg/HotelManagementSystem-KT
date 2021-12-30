/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.BookingDetailEntity;
import com.ivt.jv44_final.repository.BookingDetailRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class BookingDetailService {

    @Autowired
    private BookingDetailRepository bookingDetailRepository;

    public List<BookingDetailEntity> findBookingDetailById(int id) {
        return bookingDetailRepository.findByBooking_Id(id);
    }
    
    public void saveBookingDetail(BookingDetailEntity bookingDetail) {
        bookingDetailRepository.save(bookingDetail);
    }
    
    public BookingDetailEntity findBookingDetailByBookingIdRoomId(int bookingId, int roomId) {
        return bookingDetailRepository.findByBooking_IdAndRoom_Id(bookingId, roomId);
    }
    
    public BookingDetailEntity getBookingDetail(int id){
        Optional<BookingDetailEntity> bookingDetail = bookingDetailRepository.findById(id);
        if(bookingDetail.isPresent()){
            return bookingDetail.get();
        }
        return new BookingDetailEntity();
    }
}
