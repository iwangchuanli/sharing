/*
+--------------------------------------------------------------------------
|   Sharing [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 sharing. All Rights Reserved
|   http://www.sharing.wangcl.xyz
|
+---------------------------------------------------------------------------
*/
package com.sharing.modules.service;

import com.sharing.modules.entity.Channel;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 栏目管理
 * 
 * @author wangcl
 *
 */
public interface ChannelService {
	List<Channel> findAll(int status);
	Map<Integer, Channel> findMapByIds(Collection<Integer> ids);
	Channel getById(int id);
	void update(Channel channel);
	void updateWeight(int id, int weighted);
	void delete(int id);
	long count();
}
