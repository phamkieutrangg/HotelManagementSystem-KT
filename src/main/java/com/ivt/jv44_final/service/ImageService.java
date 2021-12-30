/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.ImageEntity;
import com.ivt.jv44_final.entities.RoomTypeEntity;
import com.ivt.jv44_final.repository.ImageRepository;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KT
 */
@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    ServletContext servletContext;

    public void saveImage(ImageEntity image) {
        imageRepository.save(image);
    }
    
    public void saveImages(List<ImageEntity> images) {
        imageRepository.saveAll(images);
    }

    public List<ImageEntity> getImageByRoomType(int id) {
        return imageRepository.findByRoomType_Id(id);
    }
     public void deleteImage(int imageId) {
          imageRepository.deleteByImageId(imageId);
    }

    public ImageEntity getImage(int imageId) {
        Optional<ImageEntity> optional = imageRepository.findById(imageId);
        if(optional.isPresent()){
             return optional.get(); 
        }
        return null;   
    }

    public String uploadFileHandler(MultipartFile file) {
        try {
            byte[] bytes = file.getBytes();
            String pathName = servletContext.getRealPath("/images/");
            File dir = new File(pathName);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
            System.out.println("Path:" + fileSource);
            File serverFile = new File(fileSource);
            System.out.println("Path of image on Server: " + serverFile.getPath());
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));

            stream.write(bytes);
            stream.close();

            return file.getOriginalFilename();
        } catch (Exception e) {
            System.out.println(e);
            return "Error when uploading file" + e;
        }

    }
    
    public List<ImageEntity> uploadImage(MultipartFile[] files, HttpServletRequest request, RoomTypeEntity roomType) {
        List<ImageEntity> images = new ArrayList<>();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {
                byte[] bytes = file.getBytes();
                
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");
                
                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-management\\images\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // get file name
                String name = file.getOriginalFilename();
                
                if (name == null) {
                    name = "new-image" + name;
                }
                
                ImageEntity image = new ImageEntity();
                image.setName(name);
                image.setRoomType(roomType);
                images.add(image);
                
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return images;
    }
    
}
