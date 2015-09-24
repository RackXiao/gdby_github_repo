CREATE TABLE `t_queue_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL COMMENT '任务id',
  `tube` varchar(10) NOT NULL COMMENT '任务容器',
  `state` varchar(10) NOT NULL COMMENT '任务job状态',
  `priority` int(10) unsigned NOT NULL DEFAULT '1024' COMMENT '任务优先级 0-2^32（4,294,967,295）',
  `delay` int(10) unsigned NOT NULL COMMENT '延时投放的时间，单位为秒',
  `ttr` int(11) unsigned NOT NULL COMMENT 'job 运行时间',
  `age` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'job存活时长 单位s',
  `time_left` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'job剩余延时（当job状态为reserved时表示剩余的超时时间）',
  `reserves` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'job被reserved的次数',
  `timeouts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'job处理的超时时间',
  `releases` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'job被released的次数',
  `buries` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'job被buried的次数',
  `kicks` int(5) unsigned NOT NULL DEFAULT '0' COMMENT 'job被kiced的次数',
  `data` text NOT NULL COMMENT '队列正文部分数据(通常为json字符串)',
  `worker_result` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'worker处理结果',
  `created_time` int(11) NOT NULL,
  `updated_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础服务队列任务记录表';