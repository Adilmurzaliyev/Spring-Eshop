package com.adil.springeshop.service;

import com.adil.springeshop.domain.Bucket;
import com.adil.springeshop.domain.User;
import com.adil.springeshop.dto.BucketDTO;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;


public interface BucketService {
    Bucket createBucket(User user, List<Long> productIds);

    void addProducts(Bucket bucket, List<Long> productIds);

    BucketDTO getBucketByUser(String name);

}
