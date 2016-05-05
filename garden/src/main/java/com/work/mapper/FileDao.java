package com.work.mapper;
import org.springframework.stereotype.Repository;

import com.work.bean.File;
/**
 * @author 
 *
 */
@Repository
public interface FileDao extends BasicDao<File> {


	public File latestFile();
}