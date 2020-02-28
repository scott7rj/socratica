USE [psi]
GO

ALTER TABLE [dbo].[martian] DROP CONSTRAINT [FK_martian_base]
GO

DROP TABLE [dbo].[visitor]
GO

DROP TABLE [dbo].[inventory]
GO

DROP TABLE [dbo].[supply]
GO

DROP TABLE [dbo].[martian]
GO

DROP TABLE [dbo].[base]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[base](
	[base_id] [int] IDENTITY(1,1) NOT NULL,
	[base_name] [varchar](50) NOT NULL,
	[founded] [date],
 CONSTRAINT [PK_base] PRIMARY KEY CLUSTERED 
(
	[base_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[martian](
	[martian_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[base_id] [int] NULL,
	[super_id] [int] NULL,
 CONSTRAINT [PK_martian] PRIMARY KEY CLUSTERED 
(
	[martian_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[visitor](
	[visitor_id] [int] IDENTITY(1,1) NOT NULL,
	[host_id] [int] NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_visitor] PRIMARY KEY CLUSTERED 
(
	[visitor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[supply](
	[supply_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_supply] PRIMARY KEY CLUSTERED 
(
	[supply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[inventory](
	[base_id] [int] NOT NULL,
	[supply_id] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[martian]  WITH CHECK ADD  CONSTRAINT [FK_martian_base] FOREIGN KEY([base_id])
REFERENCES [dbo].[base] ([base_id])
GO

ALTER TABLE [dbo].[martian] CHECK CONSTRAINT [FK_martian_base]
GO

ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [FK_inventory_base] FOREIGN KEY([base_id])
REFERENCES [dbo].[base] ([base_id])
GO

ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [FK_inventory_base]
GO

ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [FK_inventory_supply] FOREIGN KEY([supply_id])
REFERENCES [dbo].[supply] ([supply_id])
GO

ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [FK_inventory_supply]
GO

insert into base values('Tharsisland','2037-06-03')
insert into base values('Valles Marineris 2.0','2040-12-01')
insert into base values('Gale Cratertown','2041-08-15')
insert into base values('New New New York','2042-01-10')
insert into base values('Olympus Mons Spa & casino',null)

insert into martian values ('Ray','Bradbury',1,null)
insert into martian values ('John','Black',4,10)
insert into martian values ('Samuel','Hinkston',4,2)
insert into martian values ('Jeff','Spender',1,9)
insert into martian values ('Sam','Parkhill',2,12)
insert into martian values ('Elma','Parkhill',3,8)
insert into martian values ('Melissa','Lewis',1,1)
insert into martian values ('Mark','Watney',3,null)
insert into martian values ('Beth','Johanssen',1,1)
insert into martian values ('Chris','Beck',4, null)
insert into martian values ('Nathaniel','York',4,2)
insert into martian values ('Elon','Musk',2,null)
insert into martian values ('John','Carter',null,8)

insert into visitor values(7, 'George', 'Ambrose')
insert into visitor values(1,'Kris','Cardenas')
insert into visitor values(9,'Priscilla','Lane')
insert into visitor values(11,'Jane','Thornton')
insert into visitor values(null,'Doug','Stavenger')
insert into visitor values(null,'Jamie','Waterman')
insert into visitor values(8,'Martin','Humphries')

insert into supply values ('Solar Panel', 'Standard 1x1 meter cell', 912)
insert into supply values ('Water Filter','This takes things out of your water so it''s drinkable', 6)
insert into supply values ('Duct Tape','A 10 meter roll of duct tape for ALL your repairs',951)
insert into supply values ('Ketchup','It''s ketchup...',206)
insert into supply values ('Battery Cell','Standard 1000 kAh battery cell for power grid (heavy item)',17)
insert into supply values ('USB 6.0 Cable','Carbon fiber coated / 15 TBps spool',42)
insert into supply values ('Fuzzy Duster','It gets dusty around here, be prepared!',19)
insert into supply values ('Mars Bars','the ORIGINAL nutrient bar made with the finest bioengineered ingredients',3801)
insert into supply values ('Air Filter','Removes 99% of all Martian dust from our ventilation unit',23)
insert into supply values ('Famous Ray''s Frozen Pizza','This Martian favorite is covered in all your favorite toppings. 1 flavor only',823)

insert into inventory values(1,1,8)
insert into inventory values(1,3,5)
insert into inventory values(1,5,1)
insert into inventory values(1,6,2)
insert into inventory values(1,8,12)
insert into inventory values(1,9,1)
insert into inventory values(2,4,5)
insert into inventory values(2,8,62)
insert into inventory values(2,10,37)
insert into inventory values(3,2,11)
insert into inventory values(3,7,2)
insert into inventory values(4,10,91)

/*
select first_name, last_name, base_name
from martian     --left table
inner join base  --right table
on martian.base_id = base.base_id; -- John and Olympus doesn't appear because they don't have a match in the other table


select first_name, last_name, base_name
from martian     --left table
left join base  --right table
on martian.base_id = base.base_id; -- John from left table appears, Olympus doesn't

select first_name, last_name, base_name
from martian     --left table
right join base  --right table
on martian.base_id = base.base_id; -- Olýmpus from right table appears, John doesn't

select first_name, last_name, base_name
from martian     --left table
full join base  --right table
on martian.base_id = base.base_id; -- John and Olympus appears

select v.first_name as visitor_fn, v.last_name as visitor_ln, 
m.first_name as martian_n, m.last_name as martian_ln
from visitor v
left join martian m
on v.host_id = m.martian_id

select m.first_name fn, m.last_name ln,
s.first_name super_fn, s.last_name super_ln
from martian m
left join martian s
on m.super_id = s.martian_id
order by m.martian_id

select s.supply_id, isnull(i.quantity,0), s.name, s.description
from (select * from inventory where base_id = 1) as i
right join supply s
on i.supply_id = s.supply_id
order by s.supply_id

select v.first_name visitor_fn, v.last_name visitor_ln,
m.first_name martian_fn, m.last_name martian_ln
from visitor v
full join martian as m
on v.host_id = m.martian_id
where m.martian_id is null or v.visitor_id is null
*/

--connects each row in the left table with each row in the right table
select b.base_id, s.supply_id, s.name,
	coalesce((select quantity 
	from inventory 
	where base_id = b.base_id and supply_id = s.supply_id), 0) quantity
from base b
cross join supply s