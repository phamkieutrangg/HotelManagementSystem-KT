/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.repository;

import com.ivt.jv44_final.entities.ServiceBookingEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author KT
 */
@Repository
public interface ServiceBookingRepository extends CrudRepository<ServiceBookingEntity, Integer>{
    List<ServiceBookingEntity> findByService_Id(int id);
    
    @Transactional
    @Modifying
    @Query("delete from ServiceBookingEntity sb where sb.id = ?1")
    public void deleteByServiceBookingId(int id);
    
    
    List<ServiceBookingEntity> findByBookingDetail_Id(int bookingDetailId);
    
    ServiceBookingEntity findByBookingDetail_IdAndService_Id(int bookingDetailId, int serviceId);

//    public void save(List<ServiceBookingEntity> serviceBookings);
    
}