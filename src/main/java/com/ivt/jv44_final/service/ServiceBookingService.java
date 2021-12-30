/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.ServiceBookingEntity;
import com.ivt.jv44_final.repository.ServiceBookingRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class ServiceBookingService {
    
    @Autowired
    private ServiceBookingRepository serviceBookingRepository;
    
    public List<ServiceBookingEntity> getServiceBookings() {
        return (List<ServiceBookingEntity>) serviceBookingRepository.findAll();
    }
    
    public List<ServiceBookingEntity> findBookingDetailById(int id) {
        return serviceBookingRepository.findByService_Id(id);
    }
     public void deleteServiceBooking(int serviceBookingId) {
          serviceBookingRepository.deleteByServiceBookingId(serviceBookingId);
    }
    public ServiceBookingEntity getServiceBooking(int serviceBookingId) {
        Optional<ServiceBookingEntity> optional = serviceBookingRepository.findById(serviceBookingId);
        if(optional.isPresent()){
             return optional.get(); 
        }
        return null;   
    }
    
    public double getPriceService(int BookingDetailId) {
        double priceService = 0;
        for(ServiceBookingEntity serviceBooking : serviceBookingRepository.findByBookingDetail_Id(BookingDetailId)) {
            priceService += serviceBooking.getPrice()*serviceBooking.getQuantity();
        }
        return priceService;       
    }
    
    public void saveServiceBooking(ServiceBookingEntity serviceBooking) {
        serviceBookingRepository.save(serviceBooking);
    }
    
     public void saveServiceBookings(List<ServiceBookingEntity> serviceBookings) {
        serviceBookingRepository.saveAll(serviceBookings);
    }
    
    public ServiceBookingEntity findServiceBookingByBookingDetailIdServiceId(int bookingDetailId, int serviceId) {
        return serviceBookingRepository.findByBookingDetail_IdAndService_Id(bookingDetailId, serviceId);
    }
}
