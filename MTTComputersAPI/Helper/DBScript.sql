USE [MTTComputers]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/20/2020 6:40:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [nvarchar](50) NOT NULL,
	[CustomerName] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 8/20/2020 6:40:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddress](
	[addressId] [int] IDENTITY(1,1) NOT NULL,
	[address1] [varchar](200) NULL,
	[address2] [varchar](200) NULL,
	[city] [varchar](200) NULL,
	[addressState] [varchar](20) NULL,
	[zip] [varchar](10) NULL,
	[addressType] [varchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[CustomerId] [nvarchar](50) NULL,
 CONSTRAINT [PK_ClientAddress] PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8305', N'Last Name Dummy 1')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8306', N'dsfsd')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8307', N'Dummy')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8308', N'Dummy User')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8309', N'asdf')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8310', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8311', N' Last Name Name')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8312', N' Last Name Name 2')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8313', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8314', N'Dummy Last Nameing')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8315', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8316', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8317', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8318', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8319', N'Last Nameing')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8320', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8321', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8322', N'dummysave')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8323', N'User Last Nameing')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8324', N'Last Name')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8325', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8326', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8327', N'')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8328', N'Last Name - 405-01')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8329', N'Last Name - 405-02')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8330', N'New Name')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8331', N'New Name Safe Harbor')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8332', N'New Name 002 SH')
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName]) VALUES (N'8333', N'New Last Name Plan')
GO
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON 
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (1, N'jkjljl', N'nkjnkjnkjn', N'kjlkjlk', N'', N'546546', N'Mailing', NULL, NULL, N'8305')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (4, N'dsfsdaf', N'gdfg', N'fsdfas', N'', N'32424', N'Mailing', NULL, NULL, N'8307')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (7, N'dfsf', N'zdfsdf', N'sdfsf', N'AZ', N'500018', N'Mailing', NULL, NULL, N'8314')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (10, N'dsfgsd', N'dsgdg', N'sfs', N'AK', N'2345677', N'Mailing', NULL, NULL, N'8319')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (13, N'hgjgh', N'ghj', N'ghjg', N'CA', N'23534534', N'Mailing', NULL, NULL, N'8322')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (16, N'dsafsd', N'sdfsdf', N'sdfsdf', N'CA', N'50001823', N'Mailing', NULL, NULL, N'8323')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (19, N'asfasdf', N'asdfsadf', N'asdfasdf', N'AR', N'500008', N'Mailing', NULL, NULL, N'8328')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (22, N'102', N'102', N'102', N'AR', N'500008', N'Mailing', NULL, NULL, N'8329')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (25, N'Raghava Colony', N'Behind Azaan International School', N'Golconda', N'TS', N'500008', N'Mailing', NULL, NULL, N'8330')
GO
INSERT [dbo].[CustomerAddress] ([addressId], [address1], [address2], [city], [addressState], [zip], [addressType], [fax], [phone], [CustomerId]) VALUES (27, N'Test', N'test', N'test', N'ste', N'500008', N'Mailing', NULL, NULL, N'8333')
GO
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_ClientAddress_Client] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FK_ClientAddress_Client]
GO
