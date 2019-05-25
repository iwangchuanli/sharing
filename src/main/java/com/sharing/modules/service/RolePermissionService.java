package com.sharing.modules.service;

import com.sharing.modules.entity.Permission;
import com.sharing.modules.entity.RolePermission;

import java.util.List;
import java.util.Set;

/**
 * @author - wangcl
 * @create - 2018/5/18
 */
public interface RolePermissionService {
    List<Permission> findPermissions(long roleId);
    void deleteByRoleId(long roleId);
    void add(Set<RolePermission> rolePermissions);

}
