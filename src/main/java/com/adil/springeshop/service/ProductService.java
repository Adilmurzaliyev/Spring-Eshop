package com.adil.springeshop.service;

import com.adil.springeshop.dto.ProductDTO;

import java.util.List;

public interface ProductService {
    List<ProductDTO> getAll();
    void addToUserBucket(Long productId, String username);
    void addProduct(ProductDTO dto);
}
