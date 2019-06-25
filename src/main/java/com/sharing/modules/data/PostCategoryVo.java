package com.sharing.modules.data;

import com.sharing.modules.entity.Category;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = true)
public class PostCategoryVo extends Category implements Serializable {
    private static final long serialVersionUID = 73354108587481371L;

    private PostVO post;
}
