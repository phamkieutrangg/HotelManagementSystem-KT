/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.repository;

import com.ivt.jv44_final.entities.ImageEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author KT
 */
@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Integer> {

    List<ImageEntity> findByRoomType_Id(int id);

    @Transactional
    @Modifying
    @Query("delete from ImageEntity i where i.id = ?1")
    public void deleteByImageId(int id);
}


