package com.sharing.modules.entity;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.NumericField;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "sharing_category")
public class Category implements Serializable {
    private static final long serialVersionUID = 2436696690653745208L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Field
    @NumericField
    @Column(name = "category_id", length = 5)
    private int categoryId;
    @Field
    @Column(name = "category_name", length = 32)
    private String categoryName;
    @Field
    @NumericField
    @Column(name = "parent_category", length = 5)
    private int parentCategory;
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date created;
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date updated;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(int parentCategory) {
        this.parentCategory = parentCategory;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }
}
