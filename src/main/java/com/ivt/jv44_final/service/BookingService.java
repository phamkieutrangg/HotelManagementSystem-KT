/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.BookingDetailEntity;
import com.ivt.jv44_final.entities.BookingEntity;
import com.ivt.jv44_final.repository.BookingRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private ServiceBookingService serviceBookingService;

    public List<BookingEntity> getBookings() {
        return (List<BookingEntity>) bookingRepository.findAll();
    }

    public BookingEntity getBooking(int id) {
        Optional<BookingEntity> bookOtional = bookingRepository.findById(id);
        if (bookOtional.isPresent()) {
            return bookOtional.get();
        }
        return new BookingEntity();
    }

    public void saveBooking(BookingEntity booking) {
        bookingRepository.save(booking);
    }

    public List<BookingEntity> setTotalPrice(List<BookingEntity> bookings) {
        for (BookingEntity booking : bookings) {
            List<BookingDetailEntity> bookingDetails = bookingDetailService.findBookingDetailById(booking.getId());
            double price = 0;
            for (BookingDetailEntity bookingDetail : bookingDetails) {
                double priceService = serviceBookingService.getPriceService(bookingDetail.getId());
                if (priceService > 0) {
                    if (bookingDetail.getDiscount() != 0) {
                        price += bookingDetail.getPrice() - bookingDetail.getPrice() * bookingDetail.getDiscount() / 100 + priceService;

                    } else {
                        price += bookingDetail.getPrice() + priceService;
                    }

                } else {
                    if (bookingDetail.getDiscount() != 0) {
                        price += bookingDetail.getPrice() - bookingDetail.getPrice() * bookingDetail.getDiscount() / 100;
                    } else {
                        price += bookingDetail.getPrice();
                    }
                }

            }
            booking.setTotalPrice(price);

        }
        return bookings;
    }

    public List<BookingEntity> searchByName(String name) {
        return bookingRepository.findByUserFullNameContaining(name);
    }
    
    public List<BookingEntity> searchByDate(Date date1, Date date2) {
        return bookingRepository.findByBookingDateBetween(date1, date2);
    }
}
