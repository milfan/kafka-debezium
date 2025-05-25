
CREATE TABLE InisiasiData.dbo.Prospeks (
	id bigint IDENTITY(1,1) NOT NULL,
	prospek_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	prospek_cycle tinyint NOT NULL,
	created_at datetime2(0) NOT NULL,
	CONSTRAINT prospeks_pk PRIMARY KEY (id)
);

CREATE TABLE InisiasiData.dbo.ProfileData (
	id bigint IDENTITY(1,1) NOT NULL,
	prospek_id bigint NOT NULL,
	fullname varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	address varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	created_at datetime2(0) NOT NULL,
	CONSTRAINT ProfileData_PK PRIMARY KEY (id)
);