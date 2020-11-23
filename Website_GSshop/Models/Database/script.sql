USE [master]
GO
/****** Object:  Database [Data_GSShop]    Script Date: 23/11/2020 10:59:28 CH ******/
CREATE DATABASE [Data_GSShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Data_GSShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Data_GSShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Data_GSShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Data_GSShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Data_GSShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Data_GSShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Data_GSShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Data_GSShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Data_GSShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Data_GSShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Data_GSShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Data_GSShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Data_GSShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Data_GSShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Data_GSShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Data_GSShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Data_GSShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Data_GSShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Data_GSShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Data_GSShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Data_GSShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Data_GSShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Data_GSShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Data_GSShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Data_GSShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Data_GSShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Data_GSShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Data_GSShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Data_GSShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Data_GSShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Data_GSShop] SET  MULTI_USER 
GO
ALTER DATABASE [Data_GSShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Data_GSShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Data_GSShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Data_GSShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Data_GSShop]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_login] [varchar](50) NULL,
	[admin_pass1] [varchar](50) NULL,
	[admin_active] [bit] NULL,
	[admin_token] [varchar](200) NULL,
	[admin_role] [int] NULL,
	[admin_datecreated] [datetime] NULL,
	[admin_name] [nvarchar](50) NULL,
	[admin_email] [varchar](50) NULL,
	[admin_pass2] [varchar](50) NULL,
	[admin_datelogin] [datetime] NULL,
	[admin_bin] [bit] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[banner_id] [int] IDENTITY(1,1) NOT NULL,
	[banner_name] [nvarchar](100) NULL,
	[banner_svg] [nvarchar](max) NULL,
	[banner_active] [bit] NULL,
	[banner_datecreated] [datetime] NULL,
	[banner_bin] [bit] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[banner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[category_image] [nvarchar](1000) NULL,
	[category_datecreated] [datetime] NULL,
	[category_active] [bit] NULL,
	[category_bin] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassificationSubCategory]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationSubCategory](
	[csc_id] [int] IDENTITY(1,1) NOT NULL,
	[csc_name] [nvarchar](100) NULL,
	[csc_image] [nvarchar](1000) NULL,
	[csc_datecreate] [datetime] NULL,
	[csc_active] [bit] NULL,
	[subcategory_id] [int] NULL,
	[csc_bin] [bit] NULL,
 CONSTRAINT [PK_ClassificationSubCategory] PRIMARY KEY CLUSTERED 
(
	[csc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Collection]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[collection_id] [int] IDENTITY(1,1) NOT NULL,
	[collection_name] [nvarchar](50) NULL,
	[collection_image1] [nvarchar](2000) NULL,
	[collection_image2] [nvarchar](2000) NULL,
	[collection_image3] [nvarchar](2000) NULL,
	[collection_datecreate] [datetime] NULL,
	[collection_active] [bit] NULL,
	[collection_bin] [bit] NULL,
	[seller_id] [int] NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[collection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment_content] [nvarchar](1000) NULL,
	[commet_datecreated] [datetime] NULL,
	[product_id] [int] NULL,
	[comment_spam] [bit] NULL,
	[comment_bin] [bit] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favourite]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite](
	[fa_id] [int] IDENTITY(1,1) NOT NULL,
	[fa_datereated] [datetime] NULL,
	[fa_bin] [bit] NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Favourite] PRIMARY KEY CLUSTERED 
(
	[fa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GSMall]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GSMall](
	[gsmall_id] [int] IDENTITY(1,1) NOT NULL,
	[gsmall_name] [nvarchar](50) NULL,
	[gsmall_slogan] [nvarchar](50) NULL,
	[gsmall_active] [bit] NULL,
	[gsmall_datecreate] [datetime] NULL,
	[gsmall_bg] [nvarchar](2000) NULL,
	[gsmall_image] [nvarchar](2000) NULL,
	[gsmall_bin] [bit] NULL,
	[gsmall_img1] [nvarchar](200) NULL,
	[gsmall_img2] [nvarchar](200) NULL,
	[gsmall_img3] [nvarchar](200) NULL,
	[gsmall_img4] [nvarchar](200) NULL,
	[gsmall_img5] [nvarchar](200) NULL,
	[gsmall_img6] [nvarchar](200) NULL,
	[gsmall_img7] [nvarchar](200) NULL,
 CONSTRAINT [PK_GSMall] PRIMARY KEY CLUSTERED 
(
	[gsmall_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Like]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[like_id] [int] IDENTITY(1,1) NOT NULL,
	[like_datecreated] [datetime] NULL,
	[like_bin] [bit] NULL,
	[product_id] [int] NULL,
	[replycomment_id] [int] NULL,
	[user_id] [int] NULL,
	[comment_id] [int] NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[like_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayDetail]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayDetail](
	[pay_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[pay_money] [money] NULL,
	[pay_amount] [int] NULL,
	[pay_datecreated] [datetime] NULL,
 CONSTRAINT [PK_PayDetail] PRIMARY KEY CLUSTERED 
(
	[pay_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NULL,
	[product_image] [nvarchar](2000) NULL,
	[product_datecreated] [datetime] NULL,
	[product_active] [bit] NULL,
	[product_note] [nvarchar](60) NULL,
	[product_price] [money] NULL,
	[product_ship] [bit] NULL,
	[product_view] [int] NULL,
	[product_love] [int] NULL,
	[product_color] [nvarchar](50) NULL,
	[product_size] [nvarchar](50) NULL,
	[product_detail] [nvarchar](max) NULL,
	[product_description] [nvarchar](max) NULL,
	[product_option] [bit] NULL,
	[product_sale] [money] NULL,
	[product_amount] [int] NULL,
	[product_dateedit] [datetime] NULL,
	[seller_id] [int] NULL,
	[category_id] [int] NULL,
	[subcategory_id] [int] NULL,
	[banner_id] [int] NULL,
	[collection_id] [int] NULL,
	[gsmail_id] [int] NULL,
	[product_bin] [bit] NULL,
	[product_related] [int] NULL,
	[user_id] [int] NULL,
	[csc_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReplyComment]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyComment](
	[replycomment_id] [int] IDENTITY(1,1) NOT NULL,
	[replycomment_content] [nvarchar](1000) NULL,
	[product_id] [int] NULL,
	[seller_id] [int] NULL,
	[replycomment_spam] [bit] NULL,
	[replycomment_datecreated] [datetime] NULL,
	[replycomment_bin] [bit] NULL,
	[user_id] [int] NULL,
	[comment_id] [int] NULL,
 CONSTRAINT [PK_ReplyComment] PRIMARY KEY CLUSTERED 
(
	[replycomment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seller]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seller](
	[seller_id] [int] IDENTITY(1,1) NOT NULL,
	[seller_pass] [varchar](50) NULL,
	[seller_email] [varchar](50) NULL,
	[seller_telephone] [varchar](12) NULL,
	[seller_token] [varchar](200) NULL,
	[seller_slider1] [nvarchar](1000) NULL,
	[seller_slider2] [nvarchar](1000) NULL,
	[seller_slider3] [nvarchar](1000) NULL,
	[seller_link1] [nvarchar](1000) NULL,
	[seller_link2] [nvarchar](1000) NULL,
	[seller_link3] [nvarchar](1000) NULL,
	[seller_logo] [nvarchar](1000) NULL,
	[seller_active] [bit] NULL,
	[seller_nameshop] [nvarchar](200) NULL,
	[seller_datecreated] [datetime] NULL,
	[seller_address] [nvarchar](500) NULL,
	[seller_datelogin] [datetime] NULL,
	[seller_detail] [nvarchar](max) NULL,
	[seller_description] [nvarchar](max) NULL,
	[seller_role] [int] NULL,
	[seller_nicename] [nvarchar](50) NULL,
	[seller_provincecity] [nvarchar](100) NULL,
	[seller_district] [nvarchar](100) NULL,
	[seller_bin] [bit] NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[seller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[subcategory_id] [int] IDENTITY(1,1) NOT NULL,
	[subcategory_name] [nvarchar](100) NULL,
	[subcategory_image] [nvarchar](1000) NULL,
	[subcategory_datecreated] [datetime] NULL,
	[subcategory_active] [bit] NULL,
	[category_id] [int] NULL,
	[subcategory_level] [bit] NULL,
	[subcategory_bin] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[subcategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 23/11/2020 10:59:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_pass] [varchar](50) NULL,
	[user_nicename] [varchar](50) NULL,
	[user_email] [varchar](100) NULL,
	[user_datecreated] [datetime] NULL,
	[user_token] [varchar](200) NULL,
	[user_datelogin] [datetime] NULL,
	[user_active] [bit] NULL,
	[user_address] [nvarchar](300) NULL,
	[user_telephone] [varchar](12) NULL,
	[user_image] [nvarchar](2000) NULL,
	[user_provincecity] [nvarchar](100) NULL,
	[user_district] [nvarchar](100) NULL,
	[user_bin] [bit] NULL,
	[user_role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([banner_id], [banner_name], [banner_svg], [banner_active], [banner_datecreated], [banner_bin]) VALUES (1, N'ĐỒNG HỒ THÔNG MINH', N'<svg class="navigate__icon navigate__icon--litter">
                        <?xml version="1.0" encoding="utf-8" ?>
                        <!-- Generator: Adobe Illustrator 22.0.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 84 91" style="enable-background:new 0 0 84 91;" xml:space="preserve">
                            <g id="BACKGROUND" class="st0"><rect x="-163" y="-109" class="st1" width="500" height="500" /></g>
                            <g id="OBJECTS">
                                <g>
                                    <g>
                                        <image style="overflow:visible;" width="36" height="18" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAASCAYAAAAzI3woAAAACXBIWXMAAAsSAAALEgHS3X78AAAA
                                        GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAZ1JREFUeNq0VsuOgzAMdHgUUBGU
                                        O1f+/4PgwrlS1QOglvKoJivvpl2CkmzXkpUI4mQ8duwI+oDUdb0GQUDLslAYhjTPM03TRFVVCdu9
                                        tAZt266n04n6vqfj8Ujn8/nLQPyY8JxHgMqyjB6PB43j+D2WZSnHYRio67pdoGLL2zzP5ea+70uF
                                        1+u6SvU8z4lFMAZQ1+t1l71g62MURRIQVGVDZcdG4AjvBQYvl4t2bbC3ie2hJv8BbM+xX/wjXPKH
                                        RWhswSdJIlPDCBBuiM0htmAgt9vNnCFcXVMgtmA4VLgoxoDAEMK1d5gLK6qzxoA4rjhQl3iuYNS8
                                        3AP0csuwEF5sHfoXIM4hQ7gOhwP9l6gV3bgOMRNs/Alm3sWIoaZpVlToNE0lGABBiQdrUIRSVZdb
                                        hvUMBu1oqxYJNZmxuCgKmXyubQJ7bNnCKfzjlwAaLZovVO1rgsGgeiJ/YHS/32WHZ6Zcc0VX0xgU
                                        mi3mKijBbxks4IaKSsos6UYovHwHgZDrnik85zQAIBUgQFnFRdd/bCWO45f2waGEPAUYAGjuFKGV
                                        wx7yAAAAAElFTkSuQmCC" transform="matrix(1 0 0 1 25 8)"></image>			
                                        <image style="overflow:visible;" width="36" height="18" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAASCAYAAAAzI3woAAAACXBIWXMAAAsSAAALEgHS3X78AAAA
                                        GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAYxJREFUeNq0lsuugyAQhkFtNbox
                                        rnyTbowbn9tX0sRYrZfWc36SMWBRaa2TTBAv8M3PDMLzPJ/Yv3HOmWVZ7Pl8MhPD+9M0KfeyLOPs
                                        oHECAgz8crnM103TMN/3lYnlazyXbQnoeZ6493q9lBbuOI7owzEXWgFEHwMMMNfrdQaC65RZU8jE
                                        7ve7+A6BElDf98KhsCIxqRWGoZgQgLSEtm3P79E9iuwbMFm1x+PB0jTlikIylOu6IgJaPhNbQu31
                                        AQK1ACPnnqMbvOs6AQQlTIG4KvZbfwkzDMOcN7K9zUa0lGzfLIeJmnBALStzNXyocwYMGRXPrkIy
                                        kOlyfaMQFYUxEFXBVi4chTIGwqalq4xf2VaQ1tpyBUFwWv4QEKrZCAjKVFV1mkK6ct/NIWyKZ+XP
                                        x0sGa9t2M5KjVpalHnbtA/qvxXH8UxDkJ3IHwd5uN24MRFBRFLG6rsVGBseRAz9aVCLacRy1J4Fl
                                        WxQFw1j0x0+ShH+kkA4OEEh0GQiDYz/BpHAcI44c2v4EGABmrAF33oWCQAAAAABJRU5ErkJggg==" transform="matrix(1 0 0 1 25 65)">
			                            </image>
                                        <linearGradient id="SVGID_1_" gradientUnits="userSpaceOnUse" x1="-1.203" y1="45.91" x2="96.7154" y2="45.91">
                                            <stop offset="0" style="stop-color:#535353" />
                                            <stop offset="0.1344" style="stop-color:#E5E5E5" />
                                            <stop offset="0.2527" style="stop-color:#B8B8B8" />
                                            <stop offset="0.4493" style="stop-color:#FFFFFF" />
                                            <stop offset="0.6935" style="stop-color:#A7A7A7" />
                                            <stop offset="0.8387" style="stop-color:#CECECE" />
                                            <stop offset="1" style="stop-color:#535353" />
			                            </linearGradient>
                                        <path class="st2" d="M63.1,61.2c0,4-3.6,7.3-8,7.3H29.6c-4.4,0-8-3.3-8-7.3V30.6c0-4,3.6-7.3,8-7.3h25.5c4.4,0,8,3.3,8,7.3V61.2z" />
                                        <path class="st3" d="M29.6,68.2c-4.2,0-7.7-3.1-7.7-7V30.6c0-3.9,3.4-7,7.7-7h25.5c4.2,0,7.7,3.1,7.7,7v30.5c0,3.9-3.4,7-7.7,7H29.6z" />
                                        <g class="st4">
                                            <path class="st5" d="M57.9,25.5c0-0.8-0.8-1.5-1.7-1.5H28.7c-0.9,0-1.7,0.7-1.7,1.5l0,0c0,0.8,0.8,1.5,1.7,1.5h27.5
					                        C57.1,27.1,57.9,26.4,57.9,25.5L57.9,25.5z" />
                                            <path class="st6" d="M57.8,25.5c0-0.8-0.7-1.5-1.7-1.5H28.8c-0.9,0-1.7,0.7-1.7,1.5l0,0c0,0.8,0.7,1.5,1.7,1.5h27.3
					                        C57,27,57.8,26.3,57.8,25.5L57.8,25.5z" />
                                            <path class="st7" d="M57.6,25.4c0-0.8-0.7-1.4-1.6-1.4h-27c-0.9,0-1.7,0.6-1.7,1.4l0,0c0,0.8,0.7,1.4,1.7,1.4h27
					                        C56.9,26.9,57.6,26.2,57.6,25.4L57.6,25.4z" />
                                            <path class="st8" d="M57.5,25.4c0-0.8-0.7-1.4-1.6-1.4H29.1c-0.9,0-1.6,0.6-1.6,1.4l0,0c0,0.8,0.7,1.4,1.6,1.4h26.8
					                        C56.7,26.8,57.5,26.1,57.5,25.4L57.5,25.4z" />
                                            <path class="st9" d="M57.3,25.3c0-0.7-0.7-1.4-1.6-1.4H29.2c-0.9,0-1.6,0.6-1.6,1.4l0,0c0,0.7,0.7,1.4,1.6,1.4h26.5
					                        C56.6,26.7,57.3,26.1,57.3,25.3L57.3,25.3z" />
                                            <path class="st10" d="M57.2,25.3c0-0.7-0.7-1.3-1.6-1.3H29.3c-0.9,0-1.6,0.6-1.6,1.3l0,0c0,0.7,0.7,1.3,1.6,1.3h26.3
					                        C56.5,26.6,57.2,26,57.2,25.3L57.2,25.3z" />
                                            <path class="st11" d="M57.1,25.2c0-0.7-0.7-1.3-1.6-1.3h-26c-0.9,0-1.6,0.6-1.6,1.3l0,0c0,0.7,0.7,1.3,1.6,1.3h26
					                        C56.3,26.5,57.1,25.9,57.1,25.2L57.1,25.2z" />
                                            <path class="st12" d="M56.9,25.2c0-0.7-0.7-1.2-1.6-1.2H29.5c-0.9,0-1.6,0.5-1.6,1.2l0,0c0,0.7,0.7,1.2,1.6,1.2h25.8
					                        C56.2,26.4,56.9,25.8,56.9,25.2L56.9,25.2z" />
                                            <path class="st13" d="M56.8,25.1c0-0.7-0.7-1.2-1.6-1.2H29.7c-0.9,0-1.6,0.5-1.6,1.2l0,0c0,0.7,0.7,1.2,1.6,1.2h25.6
					                        C56.1,26.3,56.8,25.8,56.8,25.1L56.8,25.1z" />
                                            <path class="st14" d="M56.6,25.1c0-0.6-0.7-1.1-1.6-1.1H29.8c-0.9,0-1.6,0.5-1.6,1.1l0,0c0,0.6,0.7,1.1,1.6,1.1h25.3
					                        C56,26.2,56.6,25.7,56.6,25.1L56.6,25.1z" />
                                            <path class="st15" d="M56.5,25c0-0.6-0.7-1.1-1.5-1.1H29.9c-0.9,0-1.5,0.5-1.5,1.1l0,0c0,0.6,0.7,1.1,1.5,1.1H55
					                        C55.8,26.1,56.5,25.6,56.5,25L56.5,25z" />
                                            <path class="st16" d="M56.4,25c0-0.6-0.7-1.1-1.5-1.1H30c-0.8,0-1.5,0.5-1.5,1.1l0,0c0,0.6,0.7,1.1,1.5,1.1h24.8
					                        C55.7,26,56.4,25.6,56.4,25L56.4,25z" />
                                            <path class="st17" d="M56.2,24.9c0-0.6-0.7-1-1.5-1H30.1c-0.8,0-1.5,0.5-1.5,1l0,0c0,0.6,0.7,1,1.5,1h24.6
					                        C55.6,25.9,56.2,25.5,56.2,24.9L56.2,24.9z" />
                                            <path class="st18" d="M56.1,24.9c0-0.5-0.7-1-1.5-1H30.3c-0.8,0-1.5,0.4-1.5,1l0,0c0,0.5,0.7,1,1.5,1h24.3
					                        C55.4,25.8,56.1,25.4,56.1,24.9L56.1,24.9z" />
                                            <path class="st19" d="M56,24.8c0-0.5-0.7-0.9-1.5-0.9H30.4c-0.8,0-1.5,0.4-1.5,0.9l0,0c0,0.5,0.7,0.9,1.5,0.9h24.1
					                        C55.3,25.7,56,25.3,56,24.8L56,24.8z" />
                                            <path class="st20" d="M55.8,24.8c0-0.5-0.7-0.9-1.5-0.9H30.5c-0.8,0-1.5,0.4-1.5,0.9l0,0c0,0.5,0.7,0.9,1.5,0.9h23.9
					                        C55.2,25.6,55.8,25.3,55.8,24.8L55.8,24.8z" />
                                            <path class="st21" d="M55.7,24.7c0-0.5-0.7-0.8-1.5-0.8H30.6c-0.8,0-1.5,0.4-1.5,0.8l0,0c0,0.5,0.7,0.8,1.5,0.8h23.6
					                        C55,25.6,55.7,25.2,55.7,24.7L55.7,24.7z" />
			                            </g>
                                        <linearGradient id="SVGID_2_" gradientUnits="userSpaceOnUse" x1="42.3664" y1="41.7321" x2="42.3664" y2="106.1024">
                                            <stop offset="0" style="stop-color:#F3F3F3" />
                                            <stop offset="0.3978" style="stop-color:#A6A6A6" />
                                            <stop offset="0.6129" style="stop-color:#9D9D9D" />
                                            <stop offset="1" style="stop-color:#F3F3F3" />
			                            </linearGradient>
                                        <path class="st22" d="M55.9,25.5H28.8c-3.5,0-6.4,2.6-6.4,5.8v31.8c1,2.8,3.9,4.8,7.3,4.8h25.4c3.4,0,6.3-2,7.3-4.8V31.3
				                        C62.3,28.1,59.5,25.5,55.9,25.5z" />
                                        <path class="st3" d="M29.6,66.7c-3.3,0-6-2.5-6-5.5V30.6c0-3,2.7-5.5,6-5.5h25.5c3.3,0,6,2.5,6,5.5v30.5c0,3-2.7,5.5-6,5.5H29.6z" />
                                        <path class="st23" d="M29.6,66.5c-3.2,0-5.9-2.4-5.9-5.3V30.6c0-2.9,2.6-5.3,5.9-5.3h25.5c3.2,0,5.9,2.4,5.9,5.3v30.5
				                        c0,2.9-2.6,5.3-5.9,5.3H29.6z" />
                                        <g>
                                            <defs>
                                            <path id="SVGID_3_" d="M29.6,66.5c-3.2,0-5.9-2.4-5.9-5.3V30.6c0-2.9,2.6-5.3,5.9-5.3h25.5c3.2,0,5.9,2.4,5.9,5.3v30.5
						                    c0,2.9-2.6,5.3-5.9,5.3H29.6z" />
				                            </defs>
                                            <clipPath id="SVGID_4_">
                                                <use xlink:href="#SVGID_3_" style="overflow:visible;" />
				                            </clipPath>
                                            <g class="st24">
                                                <image style="overflow:visible;" width="46" height="51" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAzCAYAAADo8TpyAAAACXBIWXMAAAsSAAALEgHS3X78AAAA
                                                GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA6dJREFUeNrsWotu2jAUvc6DknSF
                                                FmirSt0/TtM+Y5r2mZ1U2hIC5AHxfE0CjomDU7raSLOE7Nh5nHt8fH2TC4GW8uPbdwoGy8/fv4hq
                                                jNgIWMcIogN6vc53bUq3w3R7APuK1vocx9lfs7/4ABCV+j3PYz+/HCFK8KQN9NvsDb5cXsLT0x8Q
                                                oNUfTJsnp0s/3peUUDzX47XruXA7mZTG+AfgSRPoKIogXsSQpiksl0tYrpbHQdFmw1T91T0IIbU+
                                                ZBzLZDyBoijgkhE3GY8PwHsy6DRNOPBZNIPXt1eI47hxasXpV/ZpjIsGYDvo9/nxarWC0c0IkiTh
                                                Btzd3tbAe7KW0zSrgX6eTvmFBxqXtC7XbWNtxiPDWC4uLvhsDwcDCMOQkzkajXfq8OQpxBOwIOgZ
                                                ayNotH6D4I8wuZPQCX0ukwo+OwgCfjxgwHEsYbJFYivWa8ARZM4GI8b4VjYpLBYLpvEVXkw+w+2V
                                                xFGXeSV8fp7nbNaf4f7uvnaeI+o7SdLdAIKtwH8WaNFNR/P5Tuuof1GuHPixO6w3G2ObjsqlagEn
                                                YK5QcfOSDHGOT5pB6AiU/zQZF+VBDALfu1z6DqmYBH6SVExq/KTFaYPGzw04pXV10y7ATZXhcNg8
                                                A63ABZaNMc5A9nq9bu6QWCAVMfqsBNMqlSzLrNg5qWqxKhknduycYuir5VWIhNykxmXmtb1KzGLx
                                                85GKxHYVl9u0a6o1XsrDZEgLosaphlSIoHLTAVY3xi2JxSup+L4Pjut0c4fGAyxdxjeb9U4olL2c
                                                mn5ta+tzlNLAtgVSedfOSWwDrmKcSDunFe5Qy6tU/luqbdE4fk/UC7L+S+VfS0UCfT47pyyTs5IK
                                                sUMq3aNDW76pdAuyLAhnFcX3/Nr7sKPK3oZVKuPqSmetfLhSMFmFfhujwzAIeSf/XFGWWiql1/PB
                                                dV3w2MmYe8Ec0CpJeLK1KAratDnp1KRc7Lp1lXmrwlrMB3m+p8669fsBXA+veV7z9eUFrrZs8xuh
                                                AQSktyNVWwTynna5S2LGbVxm2irWG4HzE8KAyWMA63zNWB/C9GXK03ZZnh+AlIFWpahCYsmwY4aT
                                                Go6QM43118fHGkaUd2NmOcsznjSaR3POfpImPFF6dPl+0Kp+uH/guVYEjd8QcZ3JmWVlLh9zipgq
                                                JMRhdfxpSSzkHfWM62p0c1MDXIFu5Kjp3xOUFsyQdYenk5MmQgYrg1be07b/qzS5bC0yTBnS9g+h
                                                vwIMAAuiLJ9U5soiAAAAAElFTkSuQmCC" transform="matrix(1 0 0 1 19 21)"></image>
				                            </g>
			                            </g>
                                        <g>
                                            <linearGradient id="SVGID_5_" gradientUnits="userSpaceOnUse" x1="63.2842" y1="59.0714" x2="63.2842" y2="44.8276">
                                                <stop offset="0" style="stop-color:#000000" />
                                                <stop offset="0.1344" style="stop-color:#C5C5C5" />
                                                <stop offset="0.2527" style="stop-color:#626262" />
                                                <stop offset="0.6935" style="stop-color:#3C3C3C" />
                                                <stop offset="0.8387" style="stop-color:#929292" />
                                                <stop offset="1" style="stop-color:#000000" />
				                            </linearGradient>
                                            <path class="st25" d="M63.8,47.2v10.4c0,0-1.1,1.4-1.1-0.9c0-2.2,0-7,0-8.6C62.7,46.6,63.6,45.8,63.8,47.2z" />
                                            <linearGradient id="SVGID_6_" gradientUnits="userSpaceOnUse" x1="64.4515" y1="52.2625" x2="57.7587" y2="52.2625">
                                                <stop offset="0" style="stop-color:#535353" />
                                                <stop offset="0.1344" style="stop-color:#E5E5E5" />
                                                <stop offset="0.2527" style="stop-color:#B8B8B8" />
                                                <stop offset="0.4493" style="stop-color:#FFFFFF" />
                                                <stop offset="0.6935" style="stop-color:#A7A7A7" />
                                                <stop offset="0.8387" style="stop-color:#CECECE" />
                                                <stop offset="1" style="stop-color:#535353" />
				                            </linearGradient>
                                            <path class="st26" d="M63.8,47.2v10.4c0,0-0.7,1.4-0.7-0.9c0-2.2,0-7,0-8.6C63.1,46.6,63.7,45.8,63.8,47.2z" />
                                        </g>
                                        <g>
                                            <radialGradient id="SVGID_7_" cx="161.1171" cy="610.2646" r="27.0855" gradientTransform="matrix(0.4765 0 0 0.1868 -12.797 -77.2533)" gradientUnits="userSpaceOnUse">
                                                <stop offset="5.913980e-02" style="stop-color:#FFFFFF" />
                                                <stop offset="0.2611" style="stop-color:#FFFFFF" />
                                                <stop offset="0.5323" style="stop-color:#575757" />
                                                <stop offset="0.6989" style="stop-color:#CECECE" />
                                                <stop offset="1" style="stop-color:#535353" />
				                            </radialGradient>
                                            <path class="st27" d="M65.1,39.8c0,0.4-0.3,0.7-0.7,0.7h-0.8c-0.4,0-0.7-0.3-0.7-0.7v-6.1c0-0.4,0.3-0.7,0.7-0.7h0.8
					                        c0.4,0,0.7,0.3,0.7,0.7V39.8z" />
                                            <path d="M63.3,33c0,0-0.8,0.1-1.2,1c-0.3,1-0.7,6.1,1.2,6.4c0,0-0.6-1.6-0.6-3.9C62.8,34.2,63.3,33,63.3,33z" />
                                            <path class="st28" d="M64.6,36.9h0.5v-0.1L64.6,36.9L64.6,36.9z M64.6,37.6h0.5v-0.1L64.6,37.6L64.6,37.6z M64.6,37.2h0.5v-0.1
					                        L64.6,37.2L64.6,37.2z M64.6,38.7h0.5v-0.1L64.6,38.7L64.6,38.7z M64.6,38h0.5v-0.1L64.6,38L64.6,38z M64.6,40.1H65
					                        c0,0,0-0.1,0.1-0.1L64.6,40.1L64.6,40.1z M64.6,40.4C64.6,40.4,64.7,40.4,64.6,40.4L64.6,40.4L64.6,40.4z M64.6,39.1h0.5V39
					                        L64.6,39.1L64.6,39.1z M64.6,39.8h0.5v-0.1L64.6,39.8L64.6,39.8z M64.6,39.4h0.5v-0.1L64.6,39.4L64.6,39.4z M64.6,38.3h0.5v-0.1
					                        L64.6,38.3L64.6,38.3z M64.6,34.4h0.5v-0.1L64.6,34.4L64.6,34.4z M64.6,33.9L64.6,33.9l0.5,0.1v-0.1H64.6z M65,33.2h-0.3v0.1
					                        L65,33.2C65,33.2,65,33.2,65,33.2z M65.1,33.6h-0.5v0.1L65.1,33.6C65.1,33.6,65.1,33.6,65.1,33.6z M64.6,34.7h0.5v-0.1
					                        L64.6,34.7L64.6,34.7z M64.6,36.5h0.5v-0.1L64.6,36.5L64.6,36.5z M64.6,35.1h0.5V35L64.6,35.1L64.6,35.1z M64.6,35.8h0.5v-0.1
					                        L64.6,35.8L64.6,35.8z M64.6,36.2h0.5v-0.1L64.6,36.2L64.6,36.2z M64.6,35.4h0.5v-0.1L64.6,35.4L64.6,35.4z" />
			                            </g>
                                        <g>
                                            <g>
                                                <rect x="42.1" y="33.5" class="st29" width="0.4" height="1" />
                                                <rect x="42.1" y="57.4" class="st29" width="0.4" height="1" />
                                                <rect x="54.9" y="45.7" class="st29" width="1.1" height="0.4" />
                                                <rect x="28.6" y="45.7" class="st29" width="1.1" height="0.4" />
				                            </g>
                                            <g>
                                                <polygon class="st29" points="48.4,35.9 48.7,36.1 49.3,35.2 48.9,35.1 					" />
                                                <polygon class="st29" points="35.3,56.6 35.6,56.8 36.2,55.9 35.8,55.8 					" />
                                                <polygon class="st29" points="53.3,51.5 53.1,51.8 54,52.3 54.2,52 					" />
                                                <polygon class="st29" points="30.3,39.9 31.3,40.4 31.5,40 30.5,39.5 					" />
				                            </g>
                                            <g>
                                                <polygon class="st29" points="53.1,40 53.3,40.3 54.2,39.8 54,39.5 					" />
                                                <polygon class="st29" points="30.3,52 30.5,52.3 31.5,51.8 31.3,51.5 					" />
                                                <polygon class="st29" points="48.8,55.7 48.4,55.9 49,56.8 49.3,56.6 					" />
                                                <polygon class="st29" points="35.3,35.2 35.8,36.1 36.1,35.9 35.6,35.1 					" />
				                            </g>
                                            <g>
                                                <polygon class="st30" points="43.5,34.5 43.6,34.5 43.7,33.5 43.6,33.5 					" />
                                                <polygon class="st30" points="40.8,58.3 40.9,58.3 41.1,57.3 40.9,57.3 					" />
                                                <polygon class="st30" points="54.8,47 54.8,47.1 55.9,47.2 55.9,47.1 					" />
                                                <polygon class="st30" points="28.7,44.7 29.7,44.8 29.8,44.7 28.7,44.6 					" />
                                                <polygon class="st30" points="54.6,48.4 55.6,48.6 55.7,48.4 54.6,48.2 					" />
                                                <polygon class="st30" points="28.9,43.4 29.9,43.6 30,43.5 28.9,43.3 					" />
                                                <polygon class="st30" points="39.4,58.1 39.5,58.1 39.7,57.1 39.6,57.1 					" />
                                                <polygon class="st30" points="44.8,34.7 45,34.7 45.2,33.7 45.1,33.7 					" />
                                                <polygon class="st30" points="46.1,35 46.3,35 46.6,34.1 46.5,34.1 					" />
                                                <polygon class="st30" points="37.9,57.7 38.1,57.8 38.4,56.8 38.3,56.8 					" />
                                                <polygon class="st30" points="54.2,49.5 55.3,49.9 55.3,49.7 54.3,49.4 					" />
                                                <polygon class="st30" points="29.3,42.1 30.3,42.4 30.3,42.3 29.3,42 					" />
                                                <polygon class="st30" points="53.7,50.7 54.7,51.1 54.8,51 53.8,50.6 					" />
                                                <polygon class="st30" points="29.8,40.8 30.8,41.2 30.8,41.1 29.8,40.7 					" />
                                                <polygon class="st30" points="36.6,57.2 36.7,57.3 37.2,56.4 37,56.3 					" />
                                                <polygon class="st30" points="47.4,35.4 47.5,35.5 48,34.6 47.8,34.5 					" />
				                            </g>
                                            <g>
                                                <polygon class="st30" points="53.7,41.1 53.8,41.3 54.8,40.8 54.7,40.7 					" />
                                                <polygon class="st30" points="29.8,51 29.8,51.1 30.8,50.7 30.8,50.6 					" />
                                                <polygon class="st30" points="47.5,56.3 47.4,56.4 47.8,57.3 48,57.2 					" />
                                                <polygon class="st30" points="36.6,34.6 37,35.5 37.2,35.4 36.7,34.5 					" />
                                                <polygon class="st30" points="46.1,56.8 46.5,57.8 46.6,57.7 46.3,56.8 					" />
                                                <polygon class="st30" points="37.9,34.1 38.3,35 38.4,35 38.1,34.1 					" />
                                                <polygon class="st30" points="29.3,49.7 29.3,49.8 30.3,49.5 30.3,49.4 					" />
                                                <polygon class="st30" points="54.2,42.3 54.3,42.4 55.3,42.1 55.3,42 					" />
                                                <polygon class="st30" points="54.6,43.5 54.6,43.6 55.7,43.4 55.6,43.3 					" />
                                                <polygon class="st30" points="28.9,48.4 28.9,48.6 30,48.4 29.9,48.2 					" />
                                                <polygon class="st30" points="44.8,57.1 45,58.1 45.2,58.1 45,57.1 					" />
                                                <polygon class="st30" points="39.4,33.7 39.6,34.7 39.7,34.7 39.5,33.7 					" />
                                                <polygon class="st30" points="43.5,57.3 43.6,58.3 43.7,58.3 43.6,57.3 					" />
                                                <polygon class="st30" points="40.8,33.5 40.9,34.5 41.1,34.5 40.9,33.5 					" />
                                                <polygon class="st30" points="28.7,47.1 28.7,47.2 29.8,47.1 29.7,47 					" />
                                                <polygon class="st30" points="54.8,44.7 54.8,44.8 55.9,44.7 55.9,44.6 					" />
				                            </g>
                                            <g>
                                                <polygon class="st30" points="49.6,36.6 49.7,36.7 50.4,35.9 50.3,35.8 					" />
                                                <polygon class="st30" points="34.2,55.9 34.3,56 34.9,55.2 34.8,55.1 					" />
                                                <polygon class="st30" points="52.5,52.6 52.4,52.7 53.3,53.3 53.4,53.2 					" />
                                                <polygon class="st30" points="31.2,38.6 32,39.2 32.1,39.1 31.2,38.5 					" />
                                                <polygon class="st30" points="51.6,53.6 52.4,54.3 52.5,54.2 51.7,53.5 					" />
                                                <polygon class="st30" points="32.1,37.6 32.9,38.3 33,38.2 32.2,37.5 					" />
                                                <polygon class="st30" points="33,55.1 33.1,55.2 33.9,54.5 33.8,54.4 					" />
                                                <polygon class="st30" points="50.7,37.4 50.8,37.4 51.5,36.7 51.4,36.6 					" />
                                                <polygon class="st30" points="51.6,38.2 51.7,38.3 52.5,37.7 52.4,37.6 					" />
                                                <polygon class="st30" points="32,54.1 32.1,54.2 32.9,53.6 32.8,53.5 					" />
                                                <polygon class="st30" points="50.6,54.5 51.3,55.2 51.4,55.2 50.7,54.4 					" />
                                                <polygon class="st30" points="33.1,36.7 33.8,37.4 33.9,37.3 33.2,36.6 					" />
                                                <polygon class="st30" points="49.5,55.3 50.2,56.1 50.3,56 49.7,55.2 					" />
                                                <polygon class="st30" points="34.3,35.8 34.9,36.6 35,36.5 34.4,35.7 					" />
                                                <polygon class="st30" points="31.1,53.1 31.2,53.2 32.1,52.6 32,52.5 					" />
                                                <polygon class="st30" points="52.5,39.2 52.6,39.3 53.4,38.7 53.4,38.6 					" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M41.5,37.9h-0.3v-1.7c0-0.1,0-0.3,0-0.4c0,0-0.1,0-0.1,0.1c0,0-0.2,0.1-0.4,0.3L40.6,36l0.7-0.5h0.3V37.9z" />
                                                <path class="st21" d="M44.2,37.9h-1.7v-0.2l0.7-0.6c0.2-0.2,0.4-0.3,0.4-0.4c0.1-0.1,0.1-0.2,0.2-0.2c0-0.1,0.1-0.2,0.1-0.3
						                        c0-0.1,0-0.2-0.1-0.3c-0.1-0.1-0.2-0.1-0.4-0.1c-0.1,0-0.2,0-0.3,0c-0.1,0-0.2,0.1-0.3,0.2l-0.2-0.2c0.2-0.2,0.5-0.3,0.8-0.3
						                        c0.2,0,0.4,0.1,0.6,0.2c0.1,0.1,0.2,0.3,0.2,0.5c0,0.2,0,0.3-0.1,0.5c-0.1,0.1-0.3,0.3-0.5,0.6l-0.6,0.5v0h1.4V37.9z" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M36.8,39.1h-0.3v-1.7c0-0.1,0-0.3,0-0.4c0,0-0.1,0-0.1,0.1c0,0-0.2,0.1-0.4,0.3l-0.2-0.2l0.7-0.5h0.3V39.1z" />
                                                <path class="st21" d="M38.9,39.1h-0.3v-1.7c0-0.1,0-0.3,0-0.4c0,0-0.1,0-0.1,0.1c0,0-0.2,0.1-0.4,0.3l-0.2-0.2l0.7-0.5h0.3V39.1z" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M33.1,42.6h-0.3v-1.7c0-0.1,0-0.3,0-0.4c0,0-0.1,0-0.1,0.1c0,0-0.2,0.1-0.4,0.3l-0.2-0.2l0.7-0.5h0.3V42.6z" />
                                                <path class="st21" d="M35.8,41.4c0,0.4-0.1,0.7-0.2,0.9c-0.1,0.2-0.4,0.3-0.7,0.3c-0.3,0-0.5-0.1-0.7-0.3
						                        c-0.1-0.2-0.2-0.5-0.2-0.9c0-0.4,0.1-0.7,0.2-0.9c0.1-0.2,0.4-0.3,0.7-0.3c0.3,0,0.5,0.1,0.7,0.3C35.7,40.7,35.8,41,35.8,41.4z
						                        M34.4,41.4c0,0.4,0,0.6,0.1,0.8c0.1,0.2,0.2,0.2,0.4,0.2c0.2,0,0.3-0.1,0.4-0.2c0.1-0.2,0.1-0.4,0.1-0.8c0-0.3,0-0.6-0.1-0.8
						                        c-0.1-0.2-0.2-0.2-0.4-0.2c-0.2,0-0.3,0.1-0.4,0.2C34.4,40.8,34.4,41.1,34.4,41.4z" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M41.5,55.3c0-0.5,0.1-0.8,0.3-1.1c0.2-0.2,0.5-0.4,0.9-0.4c0.1,0,0.2,0,0.3,0v0.2c-0.1,0-0.2,0-0.3,0
						                        c-0.3,0-0.5,0.1-0.6,0.2c-0.2,0.2-0.2,0.4-0.2,0.8h0c0.1-0.2,0.3-0.3,0.6-0.3c0.2,0,0.4,0.1,0.6,0.2c0.1,0.1,0.2,0.3,0.2,0.5
						                        c0,0.3-0.1,0.4-0.2,0.6c-0.2,0.1-0.4,0.2-0.6,0.2c-0.3,0-0.5-0.1-0.7-0.3C41.5,55.9,41.5,55.6,41.5,55.3z M42.4,56.1
						                        c0.2,0,0.3,0,0.4-0.1c0.1-0.1,0.1-0.2,0.1-0.4c0-0.2,0-0.3-0.1-0.4c-0.1-0.1-0.2-0.1-0.4-0.1c-0.1,0-0.2,0-0.3,0.1
						                        c-0.1,0-0.2,0.1-0.2,0.2c-0.1,0.1-0.1,0.1-0.1,0.2c0,0.1,0,0.2,0.1,0.3c0,0.1,0.1,0.2,0.2,0.2C42.1,56.1,42.2,56.1,42.4,56.1z" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M32.5,45.7c0,0.9-0.4,1.4-1.2,1.4c-0.1,0-0.3,0-0.3,0v-0.2c0.1,0,0.2,0,0.3,0c0.3,0,0.5-0.1,0.7-0.2
						                        c0.1-0.2,0.2-0.4,0.2-0.8h0c-0.1,0.1-0.2,0.2-0.3,0.2c-0.1,0-0.2,0.1-0.4,0.1c-0.2,0-0.4-0.1-0.6-0.2c-0.1-0.1-0.2-0.3-0.2-0.5
						                        c0-0.3,0.1-0.4,0.2-0.6c0.2-0.1,0.4-0.2,0.6-0.2c0.2,0,0.3,0,0.5,0.1c0.1,0.1,0.2,0.2,0.3,0.4C32.5,45.3,32.5,45.5,32.5,45.7z
						                            M31.6,44.9c-0.2,0-0.3,0.1-0.4,0.2c-0.1,0.1-0.1,0.2-0.1,0.4c0,0.2,0,0.3,0.1,0.4c0.1,0.1,0.2,0.1,0.4,0.1
						                        c0.1,0,0.2,0,0.3-0.1c0.1,0,0.2-0.1,0.2-0.2c0.1-0.1,0.1-0.1,0.1-0.2c0-0.1,0-0.2-0.1-0.3c0-0.1-0.1-0.2-0.2-0.2
						                        C31.8,44.9,31.7,44.9,31.6,44.9z" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M33.4,49.3c0.2,0,0.4,0.1,0.6,0.2c0.1,0.1,0.2,0.2,0.2,0.4c0,0.1,0,0.2-0.1,0.3c-0.1,0.1-0.2,0.2-0.4,0.3
						                        c0.2,0.1,0.4,0.2,0.5,0.3c0.1,0.1,0.1,0.2,0.1,0.4c0,0.2-0.1,0.4-0.2,0.5c-0.2,0.1-0.4,0.2-0.6,0.2c-0.3,0-0.5-0.1-0.7-0.2
						                        c-0.2-0.1-0.2-0.3-0.2-0.5c0-0.3,0.2-0.5,0.6-0.6c-0.2-0.1-0.3-0.2-0.4-0.3c-0.1-0.1-0.1-0.2-0.1-0.3c0-0.2,0.1-0.3,0.2-0.4
						                        C32.9,49.4,33.1,49.3,33.4,49.3z M32.8,51.2c0,0.1,0.1,0.2,0.2,0.3c0.1,0.1,0.2,0.1,0.4,0.1c0.2,0,0.3,0,0.4-0.1
						                        c0.1-0.1,0.2-0.2,0.2-0.3c0-0.1,0-0.2-0.1-0.3c-0.1-0.1-0.3-0.2-0.5-0.2c-0.2,0.1-0.3,0.1-0.4,0.2C32.8,50.9,32.8,51,32.8,51.2
						                        z M33.4,49.5c-0.2,0-0.3,0-0.4,0.1c-0.1,0.1-0.1,0.2-0.1,0.3c0,0.1,0,0.2,0.1,0.3c0.1,0.1,0.2,0.1,0.4,0.2
						                        c0.2-0.1,0.3-0.1,0.4-0.2c0.1-0.1,0.1-0.2,0.1-0.3c0-0.1,0-0.2-0.1-0.3C33.6,49.6,33.5,49.5,33.4,49.5z" />
				                            </g>
                                            <g><path class="st21" d="M36.4,54.9l1.1-2.2h-1.4v-0.3h1.8v0.2l-1.1,2.2H36.4z" /></g>
                                            <g>
                                                <path class="st21" d="M47.5,53.6c0.3,0,0.5,0.1,0.7,0.2c0.2,0.1,0.2,0.3,0.2,0.5c0,0.2-0.1,0.4-0.3,0.6
						                        c-0.2,0.1-0.4,0.2-0.7,0.2c-0.3,0-0.5,0-0.7-0.1v-0.3c0.1,0,0.2,0.1,0.3,0.1c0.1,0,0.2,0,0.4,0c0.2,0,0.4,0,0.5-0.1
						                        c0.1-0.1,0.2-0.2,0.2-0.4c0-0.3-0.2-0.5-0.7-0.5c-0.1,0-0.3,0-0.5,0l-0.2-0.1l0.1-1.1h1.3v0.3h-1.1l-0.1,0.7
						                        C47.2,53.6,47.4,53.6,47.5,53.6z" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M52.1,51.2h-0.4v0.6h-0.3v-0.6h-1.3v-0.2l1.3-1.6h0.3v1.6h0.4V51.2z M51.5,50.9v-0.8c0-0.2,0-0.3,0-0.5h0
						                        c-0.1,0.1-0.1,0.2-0.2,0.3l-0.8,1.1H51.5z" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M53.6,45.4c0,0.2,0,0.3-0.1,0.4c-0.1,0.1-0.2,0.2-0.4,0.2v0c0.2,0,0.4,0.1,0.5,0.2
						                        c0.1,0.1,0.2,0.2,0.2,0.4c0,0.2-0.1,0.4-0.3,0.5c-0.2,0.1-0.4,0.2-0.7,0.2c-0.1,0-0.3,0-0.4,0c-0.1,0-0.2-0.1-0.3-0.1v-0.3
						                        c0.1,0.1,0.2,0.1,0.4,0.1c0.1,0,0.3,0,0.4,0c0.5,0,0.7-0.2,0.7-0.5c0-0.3-0.3-0.4-0.8-0.4h-0.3v-0.2h0.3c0.2,0,0.4,0,0.5-0.1
						                        c0.1-0.1,0.2-0.2,0.2-0.3c0-0.1,0-0.2-0.1-0.3C53.1,45.1,53,45,52.8,45c-0.1,0-0.2,0-0.3,0c-0.1,0-0.2,0.1-0.4,0.2L52,45
						                        c0.1-0.1,0.2-0.1,0.4-0.2c0.1,0,0.3-0.1,0.4-0.1c0.3,0,0.5,0.1,0.6,0.2C53.6,45.1,53.6,45.2,53.6,45.4z" />
				                            </g>
                                            <g>
                                                <path class="st21" d="M52.4,42.6h-1.7v-0.2l0.7-0.6c0.2-0.2,0.4-0.3,0.4-0.4c0.1-0.1,0.1-0.2,0.2-0.2c0-0.1,0.1-0.2,0.1-0.3
						                        c0-0.1,0-0.2-0.1-0.3c-0.1-0.1-0.2-0.1-0.4-0.1c-0.1,0-0.2,0-0.3,0c-0.1,0-0.2,0.1-0.3,0.2l-0.2-0.2c0.2-0.2,0.5-0.3,0.8-0.3
						                        c0.2,0,0.4,0.1,0.6,0.2c0.1,0.1,0.2,0.3,0.2,0.5c0,0.2,0,0.3-0.1,0.5c-0.1,0.1-0.3,0.3-0.5,0.6l-0.6,0.5v0h1.4V42.6z" />
				                            </g>
                                            <g><path class="st21" d="M47.7,39.1h-0.3v-1.7c0-0.1,0-0.3,0-0.4c0,0-0.1,0-0.1,0.1c0,0-0.2,0.1-0.4,0.3l-0.2-0.2l0.7-0.5h0.3V39.1z" /></g>
                                            <g>
                                                <g>
                                                    <path class="st21" d="M42.6,45.7c0,0-0.1,0-0.1-0.1c-0.1-0.1,0-0.2,0-0.2l2-1.3c0.1,0,0.2,0,0.2,0c0.1,0.1,0,0.2,0,0.2
							                        L42.6,45.7C42.7,45.7,42.7,45.7,42.6,45.7z" />
					                            </g>
                                                <g>
                                                    <path class="st21" d="M43.7,45.3c-0.1,0-0.3-0.1-0.4-0.2c-0.2-0.2-0.1-0.5,0.1-0.6l8.5-5.6c0.2-0.1,0.5-0.1,0.7,0.1
							                        c0.2,0.2,0.1,0.5-0.1,0.6L44,45.2C43.9,45.3,43.8,45.3,43.7,45.3z" />
					                            </g>
				                            </g>
                                            <g>
                                                <g><path class="st21" d="M41.8,45.7C41.7,45.7,41.7,45.7,41.8,45.7l-1.8-1.1c-0.1,0-0.1-0.1,0-0.2c0.1-0.1,0.2-0.1,0.2,0l1.7,1.1
							                    c0.1,0,0.1,0.1,0,0.2C41.9,45.7,41.8,45.7,41.8,45.7z" /></g>
                                                <g><path class="st21" d="M41,45.5c-0.1,0-0.2,0-0.3-0.1l-4.5-2.8c-0.2-0.1-0.3-0.4-0.1-0.6c0.1-0.2,0.4-0.3,0.7-0.1l4.5,2.8
							                    c0.2,0.1,0.3,0.4,0.1,0.6C41.3,45.4,41.1,45.5,41,45.5z" /></g>
				                            </g>
                                            <rect x="42.1" y="46.4" class="st31" width="0.3" height="11" />
                                            <rect x="42.1" y="43.9" class="st31" width="0.3" height="1.6" />
                                            <g>
                                                <path class="st21" d="M42.2,46.6c-0.4,0-0.7-0.3-0.7-0.7c0-0.4,0.3-0.7,0.7-0.7c0.4,0,0.7,0.3,0.7,0.7
						                        C43,46.3,42.6,46.6,42.2,46.6z M42.2,45.6c-0.2,0-0.4,0.2-0.4,0.4c0,0.2,0.2,0.4,0.4,0.4c0.2,0,0.4-0.2,0.4-0.4
						                        C42.7,45.7,42.5,45.6,42.2,45.6z" />
				                            </g>
			                            </g>
		                            </g>
	                            </g>
                            </g>
                            <g id="DESIGNED_BY_FREEPIK" class="st0"></g>
                        </svg>
                    </svg>', 1, CAST(0x0000AC6000000000 AS DateTime), NULL)
INSERT [dbo].[Banner] ([banner_id], [banner_name], [banner_svg], [banner_active], [banner_datecreated], [banner_bin]) VALUES (2, N'PHỤ KIỆN', N'<svg class="navigate__icon navigate__icon--health">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="katman_1" x="0px" y="0px" viewBox="0 0 114.1 107.9" style="enable-background:new 0 0 114.1 107.9;" xml:space="preserve">
                            <g>
                                <g><g><g><path class="st0F" d="M21,51.1c0,0.9-0.7,1.6-1.6,1.6L8.2,53c-0.9,0-1.6-0.7-1.6-1.6L5.5,3.7C5.5,2.8,6.2,2,7.1,2l11.3-0.3      c0.9,0,1.6,0.7,1.6,1.6L21,51.1z" /></g></g></g>
                                <g><g><g><path class="st1F" d="M22.1,34.3c0,0.9-0.7,1.6-1.6,1.6L6.4,36.2c-0.9,0-1.6-0.7-1.6-1.6L4.4,20.5c0-0.9,0.7-1.6,1.6-1.6      l14.1-0.3c0.9,0,1.6,0.7,1.6,1.6L22.1,34.3z" /></g></g></g>
                                <g><g><g><path class="st2F" d="M19.5,32.2c0,0.6-0.5,1.1-1.1,1.2l-9.9,0.2c-0.6,0-1.1-0.5-1.2-1.1L7,22.5c0-0.6,0.5-1.1,1.1-1.2l9.9-0.2      c0.6,0,1.1,0.5,1.2,1.1L19.5,32.2z" /></g></g></g>
                                <g>
                                    <g><g><g><path class="st3F" d="M18.1,28c0,0.4-0.3,0.7-0.6,0.7l-3.8,0.1c-0.4,0-0.7-0.3-0.7-0.6l0,0c0-0.4,0.3-0.7,0.6-0.7l3.8-0.1       C17.8,27.3,18.1,27.6,18.1,28L18.1,28z" /></g></g></g>
                                    <g><g><g><path class="st3F" d="M13.9,28.3c0,0.3-0.2,0.5-0.5,0.5l0,0c-0.3,0-0.5-0.2-0.5-0.5l-0.1-5.4c0-0.3,0.2-0.5,0.5-0.5l0,0       c0.3,0,0.5,0.2,0.5,0.5L13.9,28.3z" /></g></g></g>
	                            </g>
                            </g>
                            <g>
                                <path class="st4F" d="M71.2,80.8l-1.4,4.9c0,0-11-6.6-15.3-8.1c-1.6-0.6-4.7-2-6.3-3c-2.1-1.3-5.5-3.3-9.7,0.9c0,0-6,8-8.5,4.8   c0,0-1.6-1.6,1.6-3.9c0,0,5.3-3.4,7.7-5.1c1.5-1.1,4-1.1,7.2-0.3C53,72.5,61.1,74.8,71.2,80.8z" />
                                <path class="st4F" d="M0.4,80.8l1.4,4.9c0,0,11-6.6,15.3-8.1c1.6-0.6,4.7-2,6.3-3c2.1-1.3,5.5-3.3,9.7,0.9c0,0,6,8,8.5,4.8   c0,0,1.6-1.6-1.6-3.9c0,0-5.3-3.4-7.7-5.1c-1.5-1.1-4-1.1-7.2-0.3C18.7,72.5,10.5,74.8,0.4,80.8z" />
                                <path class="st5F" d="M71,80.3l-14.9,0.2c-14.6-0.1-17,2.2-17,2.2c-0.4,0.4-0.5,0.9-1.1,1.2c-0.9,0.5-2.1,0.5-3,0.3   c-0.5-0.1-0.9-0.3-1.3-0.6c-0.3-0.3-0.4-0.7-0.7-1c0,0-2.4-2.4-17-2.3c0,0-14.8-0.2-14.9-0.2c-1.7,0-1.3,7.8,0,7.9c0,0,2,0,3.7,9.8   c0,0,1.8,6.5,10.1,6.6c0,0,9,0.6,11.8-1.6c0,0,4.5-2.2,6.6-11.1c0.1-0.6,0.2-1.1,0.5-1.6c0.2-0.4,0.5-0.8,0.8-1   c0.9-0.5,2.7-0.3,3.3,0.6c0.4,0.6,0.7,1.3,0.8,2c2.1,9,6.5,11.1,6.5,11.1c2.8,2.2,11.8,1.6,11.8,1.6c8.3-0.1,10.2-6.5,10.2-6.5   c1.7-9.7,3.7-9.7,3.7-9.7C72.6,88,72.5,80.3,71,80.3z M31.4,90.2c0,0-0.9,7.5-4,9.8c0,0-2.4,3.8-13.4,2.4c0,0-6.4,0.3-7.9-6.4   c0,0-1.4-4.9-0.8-9.1c0,0,0-4.5,4.1-4.3c0,0,15-0.6,19.4,1.1C28.9,83.8,33.4,83.7,31.4,90.2z M65.8,96.2c-1.4,6.7-7.9,6.3-7.9,6.3   c-11,1.3-13.4-2.5-13.4-2.5c-3.1-2.3-4-9.8-4-9.8c-2-6.6,2.6-6.4,2.6-6.4c4.5-1.7,19.4-1.1,19.4-1.1c4.1-0.2,4.1,4.3,4.1,4.3   C67.3,91.3,65.8,96.2,65.8,96.2z" />
                                <path class="st6F" d="M43.2,83.8c0,0-4.5-0.1-2.6,6.4c0,0,0.2,1.9,0.8,4l10.5-11.6C48.4,82.8,45,83.1,43.2,83.8z" />
                                <path class="st7F" d="M51.9,82.7L41.5,94.3c0.3,1,0.6,2,1,2.9l13.2-14.5C54.5,82.7,53.2,82.7,51.9,82.7z" />
                                <path class="st6F" d="M66.7,87.1c0,0,0-4.5-4.1-4.3c0,0-0.6,0-1.7-0.1l-16,17.7c0.9,0.9,4.2,3.1,13,2.1c0,0,6.4,0.3,7.9-6.3   C65.8,96.2,67.3,91.3,66.7,87.1z" />
                                <path class="st7F" d="M57.7,82.6L43.3,98.6c0.4,0.6,0.8,1.1,1.3,1.4c0,0,0.1,0.2,0.3,0.4l16-17.7C60.1,82.7,59,82.7,57.7,82.6z" />
                                <path class="st6F" d="M55.7,82.6L42.5,97.2c0.2,0.5,0.5,1,0.8,1.4l14.4-15.9C57.1,82.6,56.4,82.6,55.7,82.6z" />
                                <path class="st6F" d="M9.5,82.6c-4.1-0.2-4.1,4.3-4.1,4.3c-0.3,2.3,0,4.9,0.3,6.7l10-11C12.2,82.5,9.5,82.6,9.5,82.6z" />
                                <path class="st6F" d="M19.3,82.6L6.4,96.8c0.2,0.6,0.4,1.1,0.6,1.6l14.2-15.7C20.6,82.6,19.9,82.6,19.3,82.6z" />
                                <path class="st7F" d="M15.6,82.5l-10,11C5.9,95,6.2,96,6.2,96c0.1,0.3,0.1,0.5,0.2,0.7l12.8-14.2C18,82.6,16.8,82.5,15.6,82.5z" />
                                <path class="st7F" d="M21.2,82.7L7,98.4c0.4,0.8,0.9,1.5,1.5,2l15.8-17.4C23.3,82.8,22.3,82.7,21.2,82.7z" />
                                <path class="st6F" d="M28.9,83.8c-1-0.4-2.7-0.7-4.6-0.9L8.5,100.4c2.4,2.2,5.5,2.1,5.5,2.1c11,1.3,13.4-2.4,13.4-2.4   c3.1-2.3,4-9.8,4-9.8C33.4,83.7,28.9,83.8,28.9,83.8z" />
                            </g>
                            <g>
                                <path class="st8F" d="M105.3,87.8l-8.4,0l-8.4,0c0,0-0.1,12.3,0.7,15.5c0,0-0.9,1.5,7.5,1.3c8.4,0.3,7.6-1.2,7.6-1.2   C105.2,100.1,105.3,87.8,105.3,87.8z" />
                                <polygon class="st7F" points="96.9,85.2 89.2,85.2 89.2,87.7 96.9,87.8 104.7,87.8 104.7,85.2  " />
                                <path class="st9F" d="M91.6,74.8c0,0-0.9-9.6,4-13.5c0,0,4.7,5.9,5.7,7.1c0,0,0.8,1.3,0.4,6.3L91.6,74.8z" />
                                <path class="st8F" d="M97,74.4c-2.3,0-6.8,0.3-6.8,0.3l-0.1,10.4l6.8,0l6.8,0l0.1-10.4C103.8,74.8,99.3,74.5,97,74.4z" />
                            </g>
                            <g>
                                <path class="st5F" d="M54,24.9c0.4,0.1,0.8,0.3,1.3,0.4C54.9,25.2,54.5,25.1,54,24.9z" />
                                <path class="st10F" d="M89.8,27.4c1-6.7-0.8-14.3-0.8-14.3c-1.8-7-14.4-9.4-14.4-9.4c-12.8-0.8-17.1,6-17.1,6   C54.6,12.9,54,24.9,54,24.9c0.4,0.1,0.9,0.3,1.3,0.4C68.4,29.2,89.8,27.4,89.8,27.4z" />
                                <path class="st5F" d="M55.3,25.3c7.1,2.1,15.2,2.6,20.3,2.7c10,0.1,14.2-0.6,14.2-0.6S68.4,29.2,55.3,25.3z" />
                                <path class="st11F" d="M109.7,32.4c-7.8,3.9-14.8,6.5-20.5,8.2c1,1.4,2.9,3.4,6.3,3.6c0,0,6.5,0.9,12-5.1   C107.6,39.1,112.6,34.2,109.7,32.4z" />
                                <path class="st10F" d="M89.8,27.4c0,0-4.1,0.7-14.2,0.6c-5.1-0.1-13.2-0.5-20.3-2.7c-0.4-0.1-0.9-0.3-1.3-0.4L31.8,28   c0,0,8,18.6,40.3,16c0,0,6.5-0.1,17.2-3.3c5.7-1.7,12.7-4.3,20.5-8.2L89.8,27.4z" />
                                <g>
                                    <path class="st7F" d="M60.1,27.5c0,0,0.1,0.1,0.1,0.1c2-2.4,4.9-4.9,8.1-4.5c0.2,0,0.3,0.1,0.5,0.1c0-0.1,0-0.2,0-0.3    c0,0.1,0,0.2,0,0.3c0.6,0.2,1.3,0.7,1.8,1.1c0-0.6,0-1.1-0.2-1.7c-1.1-3.7-5.4-1.6-7.4-0.1c-1.6,1.2-3.5,2.8-4.2,4.8    C59.2,27.1,59.7,27.2,60.1,27.5z" />
                                    <path class="st7F" d="M66.9,27.1c-1,1-2.1,1.7-3.5,1.8c-0.9,0.1-1.8,0-2.8,0c0,0.3-0.2,0.6-0.3,0.9c0,0,0,0,0,0    c2,0.1,4.8,0.5,6.6-0.3c2-0.8,3.6-3,3.7-5.2c-0.5-0.4-1.2-0.9-1.8-1.1C68.6,24.8,67.9,26.1,66.9,27.1z" />
                                    <path class="st7F" d="M49.8,24c0,0.1,0.1,0.2,0.1,0.3c0.2-0.1,0.3-0.1,0.5-0.1c1.5,0,2.7,0.6,4,1.3c0.9,0.5,2.1,1.5,3,2.3    c0.1,0,0.2,0,0.3,0c-0.1,0-0.2,0-0.3,0c0.1,0.1,0.3,0.2,0.4,0.3c0-0.1,0.1-0.3,0.2-0.3c0.1-0.1,0.3-0.3,0.5-0.4    c-0.6-1.6-2-3.3-3.4-4c-1.7-0.8-4.7-1.4-6,0.5c-0.3,0.4-0.4,0.8-0.4,1.2c0.4-0.3,0.8-0.6,1.3-0.8C49.9,24.2,49.8,24.1,49.8,24z" />
                                    <path class="st7F" d="M57.7,29.9c-0.1,0-0.3,0-0.4,0c-1.2,0.5-2.1,2.2-2.1,3.2c-0.1,1.6,0.6,3.2,1.1,4.8c0.3,1,0.4,2.1,0.2,3.1    c-0.1,0.5-0.2,1-0.3,1.5c-0.1,0.3-0.3,1.1-0.5,1.3c0.6-0.2,0.9-0.7,1.2-1.2c0.3-0.5,0.5-0.9,0.7-1.4c0,0,0,0.2,0.1,0.3    c0,0.1,0,0.2,0,0.3c0,0.2-0.1,0.4-0.1,0.7c-0.1,0.5-0.1,0.9-0.1,1.4c0,0.1,0.1,0.4,0.1,0.4c0.3-0.9,0.9-1.7,1.2-2.7    c0.6-1.7,0-3.9-0.6-5.5c-0.6-1.5-1.2-3.8,0.1-5.6c-0.1,0-0.2-0.1-0.2-0.2C57.9,30.2,57.8,30.1,57.7,29.9z" />
                                    <path class="st7F" d="M57.7,28.1c-0.1-0.1-0.2-0.2-0.4-0.3c-1.6,0.1-3.4,0.1-4.9-0.4c-1.4-0.5-2.1-1.7-2.5-3.1    c-0.5,0.1-0.9,0.4-1.3,0.8c0,1.2,0.9,2.4,1.9,3.1c1.3,0.8,2.9,1.1,4.3,1.5c0.9,0.2,1.7,0.3,2.5,0.3c0.1,0,0.2-0.1,0.4-0.1    C57.6,29.3,57.6,28.6,57.7,28.1z" />
                                    <path class="st7F" d="M59.8,33.3c1.4,1.7,1.1,3.9,1.8,5.8c0.3,1,1,1.9,1.8,2.6c0.9,0.8,1.8,1,2.9,0.6c-0.5,0-2-0.9-1.9-1.4    c0,0,0.5,0.3,1,0.3c0.4,0,1.1,0,1.5-0.5c-2.9-0.2-3.8-3-4.1-5.5c-0.1-1.2-0.3-2.3-0.8-3.4c-0.3-0.6-1.1-1.7-1.9-1.9    c-0.4,0.3-1,0.6-1.5,0.6C58.7,31.7,59.1,32.4,59.8,33.3z" />
                                    <path class="st7F" d="M60.3,27.4c0,0-0.1-0.1-0.1-0.1c-0.4-0.4-1.1-0.4-1.7-0.2c-0.1,0-0.2,0.1-0.3,0.1c-0.2,0.1-0.4,0.3-0.6,0.4    c-0.1,0.1-0.1,0.2-0.2,0.4c-0.2,0.5-0.1,2,0,2c0.1,0.2,0.7,0.8,0.9,0.8c0.6,0.1,1.3-0.3,1.7-0.6c0.1-0.1,0.2-0.2,0.2-0.2    c0,0,0,0,0,0c0.2-0.3,0.3-0.7,0.4-1C60.8,28.4,60.7,27.8,60.3,27.4z" />
	                            </g>
                            </g>
                            <g>
                                <g>
                                    <path class="st6F" d="M66.5,53.6c-0.1,0.3-0.1,1.4,0.3,1.5c0.3,0.1,1-0.6,1.1-0.9c0.4-0.6,0.5-1.3,0.8-1.9c0.7-1.5,2.4-3.8,4.1-4.2    c0,0,1.4-0.4,2.1-0.2V47c0-0.2-2.2,0.3-2.3,0.4c-2.3,0.8-3.9,2.8-5.2,4.8C67,52.6,66.6,53.1,66.5,53.6z" />
                                    <path class="st7F" d="M87,65.9c-1.5-9.8-3.7-11-3.7-11c-1-0.5-3.2,2.5-3.2,2.5c-0.5,0.6-1.8,0.5-2.5,0.5c-1.3-0.1-2.6-0.4-3.9-0.2    c-1,0.2-2.1,0.3-3.1,0.1c-0.4,0-0.8-0.1-1.1-0.4c0,0-2.1-2.9-3.2-2.5c0,0-2.2,1.2-3.7,11c0,0-1.2,4.9,4.4,5.1h7.7h7.7    C88.2,70.8,87,65.9,87,65.9z" />
                                    <path class="st6F" d="M83.3,53.6c0.1,0.3,0.1,1.4-0.3,1.5c-0.3,0.1-1-0.6-1.1-0.9c-0.4-0.6-0.5-1.3-0.8-1.9    c-0.7-1.5-2.4-3.8-4.1-4.2c0,0-1.4-0.4-2.1-0.2V47c0-0.2,2.2,0.3,2.3,0.4c2.3,0.8,3.9,2.8,5.2,4.8C82.7,52.6,83.2,53.1,83.3,53.6z    " />
                                    <path class="st6F" d="M70.2,57.7c0,0,1.4,0.4,2.8,0.1c0,0,2.2-0.4,3.7,0c0,0,2.4,0.3,2.9,0c0,0-1.3,5.9-3.9,6.6h-2    C73.7,64.3,70.8,62.7,70.2,57.7z" />
	                            </g>
                                <g>
                                    <path class="st5F" d="M75.8,63.9c-0.1,0.3-0.3,0.6-0.7,0.7c0,0,0,0,0,0c0.2,0.6,0.3,1.2,0.4,1.8c0.1,0.6,0,1.7,0,2.3    c1-0.9,2.8-1,3-0.9c-0.1-0.7-0.2-1.4-0.5-2.1c-0.2-0.5-0.4-1-0.9-1.3c-0.3-0.1-0.7-0.1-1-0.3C76,64.2,75.9,64.1,75.8,63.9z" />
                                    <path class="st5F" d="M74.1,64.5c-0.1,0.1-0.2,0.1-0.2,0.1c-0.3,0.2-0.7,0.2-1.1,0.3c-0.6,0.2-0.9,0.9-1.1,1.5    c-0.2,0.7-0.3,1.4-0.5,2.1c0.3-0.1,1.7-0.4,2.7,0.5c0-0.6,0.3-1.3,0.4-1.9c0.1-0.8,0.3-1.7,0.6-2.4C74.5,64.7,74.2,64.7,74.1,64.5    z" />
                                    <path class="st5F" d="M80.3,59.7c-1.1,0-2.3,0.4-3.2,1.1c-0.5,0.4-1.2,1.2-1.5,1.9c0.2,0.2,0.3,0.5,0.2,0.8c0,0.1,0,0.3-0.1,0.4    c0.1,0.1,0.2,0.2,0.4,0.3c0.3,0.1,0.6,0.2,1,0.3c0.2,0.1,0.5,0.1,0.7,0.2c0.9,0.4,2,1.4,3,0.6c0.1-0.1,0.2-0.2,0.3-0.3    c0.4-0.7-0.5-1.7-0.5-2.5c0-0.5,0.4-1.2,0.6-1.8C81.4,60.2,81.2,59.7,80.3,59.7z" />
                                    <path class="st5F" d="M73.9,62.8c0.1-0.1,0.1-0.2,0.2-0.3c-0.3-0.6-0.8-1.1-1.2-1.4C72,60.5,70.8,60,69.7,60c-1,0-1.1,0.5-1,1.1    c0.1,0.6,0.5,1.3,0.6,1.8c0,0.8-0.9,1.7-0.5,2.4c0.1,0.1,0.2,0.2,0.3,0.3c1,0.8,2.1-0.2,3-0.6c0.2-0.1,0.3-0.1,0.5-0.2    c0.4-0.1,0.8-0.2,1.1-0.3c0.1,0,0.2-0.1,0.2-0.1c0,0-0.1-0.1-0.1-0.2C73.8,63.9,73.7,63.2,73.9,62.8z" />
                                    <path class="st7F" d="M75.6,62.7c-0.1-0.1-0.3-0.2-0.4-0.3c-0.3-0.1-0.8-0.1-1,0.1c-0.1,0.1-0.2,0.2-0.2,0.3    c-0.2,0.4-0.1,1.1,0.1,1.5c0,0.1,0,0.1,0.1,0.2c0.2,0.2,0.5,0.3,0.7,0.2c0.1,0,0.2,0,0.3-0.1c0,0,0,0,0,0c0.4-0.1,0.6-0.4,0.7-0.7    c0-0.1,0.1-0.3,0.1-0.4C75.9,63.2,75.8,62.9,75.6,62.7z" />
	                            </g>
                            </g>
                            <g>
                                <path class="st12F" d="M38.7,46.4c0,0.4-0.3,0.7-0.7,0.7c-0.4,0-0.7-0.3-0.7-0.7c0-0.4,0.3-0.7,0.7-0.7C38.4,45.7,38.7,46,38.7,46.4   z" />
                                <path class="st13F" d="M37.3,46.3c0,0.4-0.3,0.7-0.7,0.7c-0.4,0-0.7-0.3-0.7-0.7c0-0.4,0.3-0.7,0.7-0.7C37,45.6,37.3,45.9,37.3,46.3   z" />
                                <g><g><g><polygon class="st12F" points="36.7,49.1 36.3,48.7 37.6,46.7 38.1,47     " /></g></g></g>
                                <path class="st13F" d="M31.6,50.4c1.3,0,5.6,0,5.6,0s4.3,0,5.6,0c0.8,0,1.9,0.1,2.8,2c0,0,0.6,1.1,1.3,2.4l0,0c0,0-0.3-6.5-2.6-6.5   c-1.8,0-7.1,0-7.1,0s-5.2,0-7.1,0c-2.2,0-2.6,6.5-2.6,6.5l0,0c0.7-1.2,1.3-2.4,1.3-2.4C29.9,50.5,30.8,50.4,31.6,50.4z" />
                                <path class="st12F" d="M48.4,57.7c-0.2-0.5-0.9-1.8-1.5-3c-0.7-1.2-1.3-2.4-1.3-2.4c-0.9-2-2-2-2.8-2c-1.3,0-5.6,0-5.6,0   s-4.3,0-5.6,0c-0.8,0-1.8,0.1-2.8,2c0,0-0.6,1.1-1.3,2.4c-0.6,1.2-1.3,2.5-1.5,3c0,0-1.1,4.1,2.3,4.6h8.9h8.9   C49.5,61.9,48.4,57.7,48.4,57.7z" />
                                <g><g><g>
                                    <g><polygon class="st13F" points="37.8,49.4 36.5,46.9 37,46.6 38.3,49      " /></g>
                                    <g><g><path class="st13F" d="M37.8,49.5C37.8,49.5,37.8,49.4,37.8,49.5L36.5,47c0,0,0,0,0-0.1c0,0,0,0,0,0l0.5-0.3c0,0,0.1,0,0.1,0        l1.3,2.4c0,0,0,0,0,0.1c0,0,0,0,0,0L37.8,49.5C37.9,49.5,37.8,49.5,37.8,49.5z M36.6,47l1.2,2.3l0.4-0.2L37,46.7L36.6,47z" /></g></g>
			                    </g></g></g>
                                <path class="st7F" d="M27,58.5c0,0,3.3-7.4,5.3-7.5c2.5-0.2,4.7,0,6.9,0c0,0-4.5,0.4-6.1,0.6c-0.7,0.1-1.4,0.4-2.5,1.7L27,58.5z" />
                            </g>
                        </svg>
                    </svg>', 1, CAST(0x0000AC6000000000 AS DateTime), NULL)
INSERT [dbo].[Banner] ([banner_id], [banner_name], [banner_svg], [banner_active], [banner_datecreated], [banner_bin]) VALUES (3, N'QUẦN ÁO NAM - NỮ', N'<svg class="navigate__icon navigate__icon--grooming">
                        <?xml version="1.0" encoding="utf-8" ?>
                        <!-- Generator: Adobe Illustrator 22.0.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                        <svg version="1.1" id="katman_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 114.1 107.9" style="enable-background:new 0 0 114.1 107.9;" xml:space="preserve">
                            <g>
                                <path class="st0b" d="M19,3.3l2.4-0.7c0,0,3.6,2.9,7.9,2.5C33.6,4.8,37,3,37,3l3.9,0.9c0,0-5.9,14.2-10.9,12.9
		                        C24.9,15.5,19,3.3,19,3.3z" />
                                <path class="st1b" d="M17.1,15.2c0,0,0.1,3.6,0.5,4.7c0.4,1.1,1.2,3,1.2,3l1,6.8h18.3l0.8-7.3c0,0,1.6-3.5,1.6-4.5v-3.3
		                        c0-0.3,0-0.5,0-0.8c0.2-1.8,1.1-8.4,1.9-9.5L37,3c0,0-3.2,9.4-8.7,8.3c-5.6-1.1-6.8-8.7-6.8-8.7l-6,1.6
		                        C15.5,4.3,18.5,12.9,17.1,15.2z" />
                                <path class="st2b" d="M19.9,29.7h18.3c0,0,11.1,12.9,16.1,27.4c5,14.5,4.5,15.6,4.5,15.6S45.4,79,34.1,76.7
		                        C22.9,74.4,7.4,79.3,0,72.5C0,72.5,11,37.9,19.9,29.7z" />
                                <path class="st3b" d="M45.6,76.7c4-0.7,7.6-1.8,10-2.7C52.8,64.8,42,35.2,38.1,33.2C38.1,33.2,44.1,63,45.6,76.7z" />
                                <path class="st3b" d="M34.4,32.2c0,0,9.6,34.7,3.7,37.7C32.3,72.8,34.4,32.2,34.4,32.2z" />
                                <path class="st3b" d="M5.4,75.4c4.4,1.2,9.9,1,15.5,0.8c-0.4-16.3,3.8-44.9,3.8-44.9C15.4,36,8.5,61.9,5.4,75.4z" />
                                <path class="st3b" d="M29.1,32.2c0,0-5.1,28.5-1.4,28.5C31.4,60.7,29.1,32.2,29.1,32.2z" />
                                <path class="st3b" d="M25.4,27.9c-4.6-2.1-6-17.4-8.6-24l-1.3,0.4c0,0,3,8.7,1.7,11c0,0,0.1,3.6,0.5,4.7c0.4,1.1,1.2,3,1.2,3l1,6.8
		                        h18.3l0.2-2C36.3,28.5,29.5,29.8,25.4,27.9z" />
                                <g><path class="st4b" d="M29,30.5c-5.3,0-8.7-0.4-9.5-0.7l0.1-0.9c0.6,0.2,4.1,0.7,9.3,0.7c5.3,0,9.1-0.6,9.4-0.7l0,0.9
			                    C38,29.9,34.3,30.5,29,30.5z" /></g>
                                <g>
                                    <path class="st5b" d="M30.4,30.1c0,0.2,0,0.3-0.1,0.4c-0.2,0-0.4,0-0.7,0c-0.2,0-0.4,0-0.5,0c-0.1,0-0.2,0-0.2,0
			                        c-2.2-0.1-3.7-0.3-4.5-0.6c-0.2-0.1-0.3-0.3-0.3-0.5l0,0c0.1-0.2,0.3-0.4,0.6-0.3c0.7,0.2,2.2,0.4,4.2,0.5c0.1,0,0.1,0,0.2,0
			                        c0.2,0,0.4,0,0.5,0c0.2,0,0.4,0,0.7,0C30.3,29.8,30.4,29.9,30.4,30.1z" />
                                    <g>
                                        <path class="st5b" d="M30.2,30.5L30.2,30.5c-1.5,0-4.4-0.1-5.8-0.6c-0.2-0.1-0.3-0.3-0.3-0.5c0-0.2,0.2-0.3,0.4-0.3
				                        c0,0,0.1,0,0.1,0c1.5,0.4,3.9,0.5,5.5,0.5C30.4,29.9,30.5,30.2,30.2,30.5z" />
                                        <path class="st6b" d="M30.6,30.5c-0.5,0.8-2.4,0.9-2.9,0c0.1,0,0.2,0,0.4,0c0.2,0.2,0.6,0.3,1,0.3c0.7,0,1-0.3,1.1-0.3
				                        c0.8-0.8-1.1-1.6-2-0.9c-0.1,0-0.3,0-0.4,0c0.3-0.3,0.8-0.6,1.4-0.6C30.3,29,31,29.8,30.6,30.5z" />
		                            </g>
                                    <path class="st7b" d="M30.4,30.1c0,0.1-0.1,0.1-0.1,0.1c-0.1,0-0.1-0.1-0.1-0.1c0-0.1,0.1-0.1,0.1-0.1C30.3,30,30.4,30,30.4,30.1z" />
                                    <path class="st8b" d="M30.5,30.2h-0.2c-0.1,0-0.1,0-0.1-0.1l0,0c0-0.1,0.1-0.1,0.1-0.1h0.2c0.1,0,0.1,0,0.1,0.1l0,0
			                        C30.6,30.1,30.5,30.2,30.5,30.2z" />
                                    <path class="st9b" d="M30.6,30.1c0,0-0.1,0.1-0.1,0.1h-0.3c0,0,0.1,0.1,0.1,0.1h0.2C30.5,30.2,30.6,30.1,30.6,30.1
			                        C30.6,30.1,30.6,30.1,30.6,30.1z" />
                                    <path class="st10b" d="M28.3,29.3c0.9-0.3,1.6-0.2,2.1,0.2c0.1,0.1,0,0.2-0.1,0.1c0,0,0,0,0,0C29.9,29.3,29.2,29.1,28.3,29.3z" />
                                    <path class="st10b" d="M28.3,30.9c0.9,0.3,1.6,0.1,2.1-0.3c0.1-0.1,0-0.2-0.1-0.1c0,0,0,0,0,0C29.9,31,29.2,31.2,28.3,30.9z" />
                                    <path class="st11b" d="M25.9,13.1c-2.6,0.3-4.1,2.9-2.9,5c0,0,0,0.1,0.1,0.1c1.8,3.1,12.7,5.3,15.1,1.9
		                            C40.5,16.9,41.6,11.1,25.9,13.1z" />
                                </g>
                                <g>
                                    <g><g><g><polygon class="st12b" points="92.1,101.5 68.8,101.5 68.8,51.8 74,40.6 85,40.6 92.1,52.1 				" /></g></g></g>
                                    <g><g><g><polygon class="st13b" points="74,40.6 59.6,47.6 45.8,97.6 56.1,101.5 64.2,66.7 64.2,101.5 75,101.5 79.5,87.3 79.5,72.7" /></g></g></g>
                                    <g><g><g><polygon class="st13b" points="85,40.6 99.4,47.6 113.2,97.6 102.9,101.5 94.8,66.7 94.8,101.5 84,101.5 79.5,87.3 79.5,72.7" /></g></g></g>
                                    <g><g><g><polygon class="st14b" points="64.2,66.7 64.8,56.6 53.8,100.6 56.1,101.5 				" /></g></g></g>
                                    <g><g><g><polygon class="st15b" points="94.8,66.7 94.2,56.6 105.2,100.6 102.9,101.5 				" /></g></g></g>
                                    <g><g><g><polygon class="st15b" points="74,40.6 69.5,41.5 68,49.4 72,51.3 69,53.5 79.5,72.7 				" /></g></g></g>
                                    <g><g><g><polygon class="st14b" points="87.2,42.2 89.7,42.9 91.1,50.8 87.2,52.7 90.5,55.3 79.5,72.7 				" /></g></g></g>
                                    <g><g><g><polygon class="st15b" points="85,40.6 89.5,41.5 91.1,49.4 87,51.3 90.1,53.5 79.5,72.7 				" /></g></g></g>
                                    <g>
                                        <g><g><g><path class="st14b" d="M80.9,76.5c0,0.8-0.6,1.5-1.4,1.5c-0.8,0-1.4-0.7-1.4-1.5c0-0.8,0.6-1.5,1.4-1.5
						                C80.3,75,80.9,75.7,80.9,76.5z" /></g></g></g>
                                        <g><g><g><path class="st16b" d="M80.7,76c0,0.3-0.2,0.5-0.4,0.5c-0.2,0-0.4-0.2-0.4-0.5c0-0.3,0.2-0.5,0.4-0.5
						                C80.5,75.5,80.7,75.8,80.7,76z" /></g></g></g>
	                                </g>
                                    <g>
                                        <g><g><g><path class="st14b" d="M80.9,83.5c0,0.8-0.6,1.5-1.4,1.5c-0.8,0-1.4-0.7-1.4-1.5c0-0.8,0.6-1.5,1.4-1.5
						                C80.3,82,80.9,82.6,80.9,83.5z" /></g></g></g>
                                        <g><g><g><path class="st16b" d="M80.7,83c0,0.3-0.2,0.5-0.4,0.5c-0.2,0-0.4-0.2-0.4-0.5c0-0.3,0.2-0.5,0.4-0.5
						                C80.5,82.5,80.7,82.7,80.7,83z" /></g></g></g>
	                                </g>
                                    <g>
                                        <g><g><g><path class="st14b" d="M111.5,95.9c0,0.8-0.6,1.5-1.4,1.5c-0.8,0-1.4-0.7-1.4-1.5c0-0.8,0.6-1.5,1.4-1.5
						                C110.9,94.4,111.5,95.1,111.5,95.9z" /></g></g></g>
                                        <g><g><g><path class="st16b" d="M111.3,95.4c0,0.3-0.2,0.5-0.4,0.5c-0.2,0-0.4-0.2-0.4-0.5c0-0.3,0.2-0.5,0.4-0.5
						                C111.1,95,111.3,95.2,111.3,95.4z" /></g></g></g>
	                                </g>
                                    <g>
                                        <g><g><g><path class="st14b" d="M50.2,95.9c0,0.8-0.6,1.5-1.4,1.5c-0.8,0-1.4-0.7-1.4-1.5c0-0.8,0.6-1.5,1.4-1.5
						                C49.6,94.4,50.2,95.1,50.2,95.9z" /></g></g></g>
                                        <g><g><g><path class="st16b" d="M50,95.4c0,0.3-0.2,0.5-0.4,0.5c-0.2,0-0.4-0.2-0.4-0.5c0-0.3,0.2-0.5,0.4-0.5C49.8,95,50,95.2,50,95.4z" /></g></g></g>
	                                </g>
                                    <g><g><g><polygon class="st14b" points="94.8,86.1 87.4,82 87.4,82.9 94.8,86.9 				" /></g></g></g>
                                    <g><g><g><polygon class="st14b" points="64.2,86.1 71.7,82 71.7,82.9 64.2,86.9 				" /></g></g></g>
                                </g>
                            </g>
                        </svg>
                    </svg>', 1, CAST(0x0000AC6000000000 AS DateTime), NULL)
INSERT [dbo].[Banner] ([banner_id], [banner_name], [banner_svg], [banner_active], [banner_datecreated], [banner_bin]) VALUES (4, N'DEAL HOT', N'<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 84 91" style="enable-background:new 0 0 84 91;width: 176px;" xml:space="preserve">
                        <g id="BACKGROUND" class="st00"><rect x="-163" y="-109" class="st11" width="500" height="500" /></g>
                            <g id="OBJECTS">
                                <g>
                                    <path class="st22" d="M73.5,71.7c0-0.4,0-0.7,0-1.1c-0.5-9.4-2.5-19.4-4.3-26.7l0,0c0,0,0,0,0,0c0-0.1,0-0.2-0.1-0.3
			                        c0-0.1-0.1-0.2-0.1-0.3c0-0.1-0.1-0.2-0.1-0.3c0-0.1-0.1-0.2-0.1-0.3c0-0.1,0-0.2-0.1-0.3c0,0,0-0.1,0-0.1c0.2,0,0.4-0.1,0.7-0.1
			                        c1.6-0.3,3.1-1.2,2.4-4.1L70,30.9c-0.7-3-3.4-3-4.9-2.9c-2.9,0.3-7.3,0.8-12.3,1.5c13.1-8.8,7.3-21.2-3.3-18.2
			                        c-6.2,1.8-8.6,7.1-9.4,12.3C34.6,9.7,21,13.9,21.8,24c0.5,5.5,4.7,8.1,9.2,9.4c-0.8,0.2-1.6,0.4-2.5,0.6c0,0,0,0,0,0
			                        c-0.6,0.1-1.2,0.3-1.7,0.4c0,0,0,0,0,0c-0.6,0.1-1.1,0.3-1.7,0.4c0,0,0,0-0.1,0c-0.5,0.1-1.1,0.3-1.6,0.5c0,0-0.1,0-0.1,0
			                        c-0.5,0.2-1.1,0.3-1.6,0.5c0,0-0.1,0-0.1,0c-0.5,0.2-1,0.3-1.5,0.5c0,0-0.1,0-0.1,0c-0.5,0.2-1,0.3-1.5,0.5c0,0,0,0-0.1,0
			                        c-0.5,0.2-1,0.4-1.5,0.5c0,0,0,0,0,0c-0.5,0.2-1,0.4-1.5,0.6c-2.7,1-3.3,2.7-3.1,3.9l1,6c0.2,1.3,1.1,3.2,3.4,2.8
			                        c0.1,0,0.2,0,0.3-0.1c0,0.3,0,0.6,0.1,1l0,0c0,0,0,0,0,0c0.2,2.3,0.5,4.8,1,7.2c0,0,0,0,0,0l0,0c0.9,5.1,2.1,10.3,3.3,14.7l0,0
			                        c0,0,0,0,0,0c0.2,0.6,0.3,1.1,0.5,1.7c0,0,0,0,0,0.1c0.1,0.2,0.1,0.5,0.2,0.7c0,0.1,0,0.2,0.1,0.2c0.1,0.3,0.2,0.7,0.3,1
			                        c0,0.2,0.1,0.3,0.1,0.4c0,0.1,0.1,0.3,0.1,0.4c0.1,0.2,0.1,0.4,0.2,0.6c0,0.1,0.1,0.2,0.1,0.3c0.1,0.3,0.2,0.6,0.3,0.8
			                        c0.6,2,1.6,5.9,11.2,4.8c0,0,0,0,0,0l9.5-1.1l0,0l2.9-0.3l14.1-1.6h0l2.2-0.3c4.5-0.5,9.9-1.3,10.4-7.8
			                        C73.5,73,73.5,72.4,73.5,71.7z" />
                                    <g>
                                        <path class="st33" d="M61.3,79.6c4.5-0.5,9.9-1.3,10.4-7.8c0-0.6,0-1.3,0-2c0-0.4,0-0.7,0-1.1c-0.9-17.7-7.2-37.5-7.2-37.5
				                        L16,39.2c-3,8.7,2.4,29,5.4,39c0.6,2,1.6,5.9,11.2,4.8c0,0,0,0,0,0L61.3,79.6L61.3,79.6z" />
                                        <path class="st44" d="M67.4,42.2c-1.6-6.4-2.9-10.8-2.9-10.8L16,39.2c-0.9,2.7-1,6.5-0.7,10.8l0,0c0,0.1,0,0.2,0,0.3
				                        c0,0.1,0,0.3,0,0.4c0,0,0,0,0,0c0.2,2.1,0.5,4.3,0.9,6.5c2.1-6.9,10.8-8.6,13.1-8.9c11.6-2,26.5-4.4,36.3-5.8l0,0c0,0,0,0,0,0
				                        C66.3,42.3,66.8,42.3,67.4,42.2z" />
                                        <path class="st55" d="M40.6,32.6c0,0-19.6,1.8-20.6-10.4C19,10,38.8,6.4,40.6,32.6z" />
                                        <path class="st55" d="M38.6,33.1c0,0-3.8-19.8,9.2-23.5C60.9,5.9,66.7,25.5,38.6,33.1z" />
                                        <path class="st66" d="M41.7,30.2c0,0-3.2-11.4,4.2-14.3C53.4,13.1,57.7,24.3,41.7,30.2z" />
                                        <path class="st66" d="M38.3,30.5c0,0-12.1,1.1-12.7-6.4C25,16.6,37.2,14.3,38.3,30.5z" />
                                        <path class="st33" d="M70,36.3l-1.7-7.2c-0.7-3-3.4-3-4.9-2.9c-9.7,1-34.6,4-49.7,10c-2.7,1-3.3,2.7-3.1,3.9l1,6
				                        c0.2,1.3,1.1,3.2,3.4,2.8c8.8-1.5,35.6-6.2,50.5-8.2l0,0c0,0,0,0,0,0c0.7-0.1,1.5-0.2,2.1-0.3C69.2,40.1,70.7,39.2,70,36.3z" />
                                        <path class="st44" d="M41.2,29.3c-9.5,1.6-19.8,3.9-27.5,7c-2.7,1-3.3,2.7-3.1,3.9l1,6c0,0.2,0.1,0.3,0.1,0.5
				                        C17.2,42.7,35.2,30.2,41.2,29.3C41.1,29.3,41.2,29.3,41.2,29.3z" />
                                        <path class="st77" d="M41.1,29.3c-0.1,0-0.2,0-0.3,0.1c-0.4,0.1-0.8,0.1-1.2,0.2c-0.2,0-0.4,0.1-0.6,0.1c-0.4,0.1-0.7,0.1-1.1,0.2
				                        c-0.2,0-0.4,0.1-0.7,0.1c-0.3,0.1-0.7,0.1-1,0.2c-0.2,0-0.5,0.1-0.7,0.1c-0.4,0.1-0.7,0.1-1.1,0.2c-0.2,0-0.4,0.1-0.6,0.1
				                        c-0.1,0.6-0.1,1.2-0.2,1.8C36.8,30.7,39.4,29.6,41.1,29.3z" />
                                        <path class="st44" d="M19.6,71.9c0.6,2.3,1.2,4.5,1.8,6.3c0.6,2,1.6,5.9,11.2,4.8c0,0,0,0,0,0l26.5-3.1
				                        C39.9,79.5,23.4,73.4,19.6,71.9z" />
                                        <path class="st88" d="M55.7,49c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8s0.3-1,0.8-1.1C55.1,48.1,55.6,48.5,55.7,49z" />
                                        <path class="st99" d="M66.8,53.9c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1
				                        C66.2,53,66.7,53.4,66.8,53.9z" />
                                        <path class="st100" d="M61.2,37.6c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8s0.3-1,0.8-1.1C60.6,36.7,61.1,37,61.2,37.6z" />
                                        <path class="st99" d="M25.5,44.3c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8s0.3-1,0.8-1.1C24.9,43.4,25.4,43.8,25.5,44.3z" />
                                        <path class="st88" d="M32.2,36c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1C31.6,35.1,32.1,35.4,32.2,36z" />
                                        <path class="st22" d="M17,38.8c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1C16.4,37.9,16.9,38.2,17,38.8z" />
                                        <path class="st99" d="M52,32.2c0.1,0.5-0.3,1-0.8,1.1s-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1C51.4,31.3,51.9,31.6,52,32.2z" />
                                        <path class="st111" d="M64.9,29.7c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1
				                        C64.3,28.8,64.8,29.2,64.9,29.7z" />
                                        <circle class="st111" cx="60.5" cy="62.3" r="1" />
                                        <path class="st88" d="M57.7,73.9c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1
				                        C57.1,73,57.6,73.4,57.7,73.9z" />
                                        <path class="st100" d="M67.2,69.1c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8s0.3-1,0.8-1.1C66.6,68.2,67.1,68.5,67.2,69.1z" />
                                        <path class="st111" d="M33.5,49.9c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1
				                        C32.9,49,33.4,49.4,33.5,49.9z" />
                                        <path class="st88" d="M22.1,57.2c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1
				                        C21.5,56.3,22,56.7,22.1,57.2z" />
                                        <path class="st100" d="M33.1,63.8c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1
				                        C32.5,62.9,33,63.2,33.1,63.8z" />
                                        <path class="st99" d="M24.6,70c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1C24,69.1,24.5,69.5,24.6,70z" />
                                        <path class="st122" d="M35,78.6c0.1,0.5-0.3,1-0.8,1.1c-0.5,0.1-1-0.3-1.1-0.8c-0.1-0.5,0.3-1,0.8-1.1C34.4,77.7,34.9,78,35,78.6z" />
                                        <path class="st55" d="M33.9,30.6C32,46,42.1,81.8,42.1,81.8h0l10.4-1.2l0,0c3-10.4-6.3-52.2-6.3-52.2
				                        C42.3,29.1,38.1,29.8,33.9,30.6z" />
                                        <path class="st133" d="M34.4,45.7c0.1,0.6,0.1,1.1,0.2,1.7c4.8-0.8,9.9-1.7,14.8-2.4c-0.1-0.6-0.2-1.1-0.3-1.6
				                        C44.3,44,39.2,44.9,34.4,45.7z" />
                                        <path class="st133" d="M52.5,80.6c0.1-0.3,0.2-0.7,0.2-1.1c-4.1-0.3-8.1-0.9-11.7-1.6c0.6,2.4,1,3.9,1,3.9h0l3.4-0.4L52.5,80.6z" />
		                            </g>
	                            </g>
                            </g>
                    </svg>', 1, CAST(0x0000AC6000000000 AS DateTime), NULL)
INSERT [dbo].[Banner] ([banner_id], [banner_name], [banner_svg], [banner_active], [banner_datecreated], [banner_bin]) VALUES (5, N'THỂ THAO & DU LỊCH', N'<svg class="navigate__icon navigate__icon--accessories">
                        <?xml version="1.0" encoding="utf-8" ?>
                        <svg version="1.1" id="katman_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 114.1 107.9" style="enable-background:new 0 0 114.1 107.9;" xml:space="preserve">
                            <path class="st0c" d="M74.5,2c2.5,0.5,3.8,0.8,4.9,1.2c1.7,0.7,3.1,1.7,4.3,2.6c2.5,1.8,4.6,3.8,5.9,6.4c0.4,0.8,0.5,1.6,0.5,2.4
	                        c0,2-1.6,3.4-2.8,5.3c-1.7,2.6-3.2,5.2-4.1,8c-0.2,0.6-0.4,1.2-0.6,1.8c-0.3,1.3-0.2,2.3-0.1,3.6L84,56.1c-1.4,0-2.3,0.1-3.7,0.1
	                        c-0.3-3.4-1.4-25.3-2.5-27.1c-0.6-1-1.7-1.3-3.1-1.2c-1,0-1.9,0.4-2.7,0.8c-3.4,2-4.5,5.5-5.8,8.4c-1.1,2.6-2.1,5.2-3.1,8.3
	                        c-0.7,2.3-1.6,4.5-3.1,6.5c-1.3,1.8-3.1,3.4-5.5,4.5c-1.8,0.8-3.8,1.3-6.1,1.6c-6,0.6-11.9-0.6-17.9-1.5c-2.8-0.6-5.4-1.1-8.2-1.8
	                        c-0.6-1.1-0.6-1.1-0.6-2.3c-0.3-0.6-0.5-1.1-0.7-1.6c-1.4-3.3-1.2-6.8,2.8-8.9c2.5-1.3,6.5-1.7,9.5-2.1c1.4-0.3,2.8-0.5,4.2-0.8
	                        c0.5,0,1-0.1,1.5-0.1c1.5,0.3,2.9,0.5,4.4,0.8c0.8,0.1,1.5,0.1,2.3,0.2c0.4,0,0.9,0,1.3,0c1.8,0,1.4-0.1,2.9-1.2
	                        c0.5-0.6,1-1.1,1.5-1.7c2.3-3.3,4.4-6.5,6.5-9.9c1-1.8,2.1-3.5,3.1-5.3c0.7-1.2,1.4-2.4,2.2-3.6c1.9-3.2,3.8-6.3,5.7-9.5
	                        c0.6-0.9,1.3-1.7,1.9-2.6c0.8-1.1,1.2-1.7,1.9-2.4C73.2,3.2,73.7,2.7,74.5,2z" />
                            <path class="st1c" d="M4.2,85.5c0-1.6,0.1-3,0.6-4.3c0.5-1.3,1.2-2.5,2.4-3.7c3.3-3.5,8.7-6.5,14.6-8.8c7-2.7,14.7-4.5,20.2-4.8
	                        c2-0.1,4-0.1,6.2,0c2.3,0.1,4.8,0.2,7.7,0.5c1.4,0.1,3,0.4,4.6,0.7c1.3,0.2,2.6,0.5,3.8,0.6c1.9,0.2,3.8,0.3,5.7,0.3
	                        c-4.9,3-14.9,3.1-22.6,3c-2.4,0-4.5-0.1-6.4,0c-3.4,0.1-5.6,3.7-6.5,8.3c-0.4,1.8-0.5,3.8-0.5,5.8c0,2,0.3,3.9,0.7,5.7
	                        c1.1,4.4,3.4,7.9,7,7.8c8.2-0.1,15.8,0.3,23.8,0.7c1.6,0.1,3.1,0,4.8,0.1c-0.9,0-1.9,0.1-2.8,0.1c-2.8,0.2-5.7,0.4-8.6,0.7
	                        c-2.9,0.3-5.7,0.6-8.6,1c-1.2,0.2-2.5,0.4-3.7,0.6c-1.2,0.2-2.5,0.4-3.8,0.7c-1.6,0.3-3.3,0.7-5.1,0.9c-1.8,0.2-3.8,0.3-5.9,0.2
	                        c-2.5-0.1-5-0.3-7.5-0.8c-2.5-0.4-4.9-1-7.2-1.8c-2.4-0.9-5-2-7.1-3.5c-2.2-1.5-4-3.5-4.9-6.2c-0.2-0.6-0.4-1.2-0.5-1.8
	                        C4.3,86.7,4.2,86.1,4.2,85.5L4.2,85.5z M71.1,65.9L71.1,65.9c-0.2,0.1-1.4,0.9-1.6,1c-5.2,2.8-14.6,2.6-22.2,2.5
	                        c-2.3,0-4.5-0.1-6.3,0c-3.1,0.1-5.1,3.5-5.9,7.8c-0.3,1.7-0.5,3.5-0.5,5.3l2.8-0.2c0-0.7,0.1-1.4,0.3-2.1c0.5-2.8,1.8-5.4,4-7.6
	                        c0.2-0.2,0.6-0.2,0.9,0c0.2,0.2,0.2,0.6,0,0.9c-2,1.9-3.2,4.3-3.6,6.9c-0.1,0.6-0.2,1.2-0.2,1.8l1.7-0.1l2.2-0.1
	                        c0-0.3,0-0.5,0.1-0.8c0.4-3,1.6-5.8,3.3-7.8c0.2-0.3,0.6-0.3,0.9-0.1c0.3,0.2,0.3,0.6,0.1,0.9c-1.5,1.9-2.7,4.5-3.1,7.2
	                        c0,0.2,0,0.3-0.1,0.5l1.6-0.1l1.8-0.1c0-0.3,0.1-0.6,0.1-0.8c0.4-2.6,1.6-4.8,3.2-6.8c0.2-0.3,0.6-0.3,0.9-0.1
	                        c0.3,0.2,0.3,0.6,0.1,0.9c-1.5,1.8-2.6,3.8-2.9,6.2c0,0.2-0.1,0.4-0.1,0.6l1.4-0.1l3.7-0.2c0-0.1,0-0.3,0.1-0.4c0.3-2,1-4,2.1-6.1
	                        c0.2-0.3,0.5-0.4,0.8-0.3c0.3,0.2,0.4,0.5,0.3,0.8c-1.1,2.1-1.7,3.9-2,5.7l0,0.2l0.4,0l1.3-0.1c0.8-0.8,1.5-1.8,2.2-3
	                        c0.7-1.2,1.4-2.4,2.4-3.4c0.3-0.3,0.7-0.6,1-0.9c0.1-0.1,0.3-0.2,0.4-0.3l-0.1,0l0.7-0.4l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0
	                        l0,0l0,0c5.7-3.2,15.3-1.5,21.3-0.4l0.6,0.1c1.5,0.3,2.9,0.5,4.3,0.8c1.4,0.3,2.8,0.6,4.1,0.9c1,0.2,1.9,0.5,2.9,0.9
	                        c1,0.3,1.9,0.7,3,1.2c1.4,0.6,2.7,1.3,3.7,2.1c1,0.9,1.7,1.9,1.7,3.1c0,4.2-8.8,6.6-13.3,7.9c-0.5,0.2-1,0.3-1.4,0.4
	                        c-3.3,1-8.1,2.3-13,2.9c-4.9,0.6-9.9,0.3-13.3-1.9l0,0l0,0l0,0l0,0l0,0l0,0L63.3,91l0,0c-0.3-0.2-0.5-0.4-0.8-0.7
	                        c-0.4-0.4-0.7-0.8-1.1-1.2c-0.8-1.1-1.4-2.3-1.9-3.4c-0.3-0.6-0.6-1.2-0.9-1.8c-0.3-0.5-0.6-0.9-0.9-1.3c-0.3-0.3-0.7-0.6-1.2-0.9
	                        l-1.5,0.1l-0.4,0c-0.2,1.6-0.1,3.3,0.2,5.2c0,0.3-0.2,0.7-0.5,0.7c-0.3,0-0.6-0.2-0.7-0.5c-0.3-1.9-0.4-3.7-0.2-5.3l-3.8,0.2
	                        l-1.3,0.1c-0.1,1.6,0.2,3.4,1.1,5.3c0.1,0.3,0,0.7-0.3,0.8c-0.3,0.1-0.7,0-0.8-0.3c-0.9-2-1.2-3.9-1.2-5.7l-1.8,0.1l-1.5,0.1
	                        c-0.1,2,0.3,4,1.3,5.8c0.2,0.3,0.1,0.7-0.2,0.9c-0.3,0.2-0.7,0.1-0.8-0.2c-1.1-2-1.5-4.2-1.5-6.4l-2.3,0.1l-1.6,0.1
	                        c-0.1,2.1,0.3,4.2,0.9,6.3c0.1,0.3-0.1,0.7-0.4,0.8c-0.3,0.1-0.7-0.1-0.8-0.4c-0.7-2.1-1.1-4.4-1-6.6l-2.7,0.2
	                        c0.1,1.8,0.3,3.7,0.7,5.3c1,4.2,3.1,7.4,6.4,7.3c8.2-0.1,15.9,0.3,23.9,0.7c1.5,0.1,2.9,0.1,4.4,0.2c0.1,0,0.6,0,1,0.1
	                        c0.5,0.1,0.8,0.4,1,0.4l0,0c2.5,0,5,0,7.4,0.1c2.1,0.1,4.2,0.1,6.3,0.1c3.9,0,7.7-0.4,11.2-1.5c3.5-1.2,6.8-3.2,9.8-6.5
	                        c1-1.2,1.9-2.4,2.6-3.8c0.5-1.2,0.8-2.4,0.8-3.7c0-1.1-0.2-2.2-0.6-3.1c-0.4-1-0.9-2-1.5-2.8c-1.5-2.1-3.2-3.7-5.2-5.1
	                        c-2-1.3-4.3-2.3-7-3c-2-0.5-4.8-0.7-7.2-1c-1-0.1-1.9-0.2-2.6-0.3c-4.1-0.5-8.1-0.6-12-0.7C73,66,72,65.9,71.1,65.9L71.1,65.9z
	                            M59.2,83.6L59.2,83.6c0.3,0.6,0.6,1.2,0.9,1.8c0.5,1.1,1.1,2.2,1.8,3.3c0.3,0.4,0.6,0.8,1,1.1c0.3,0.3,0.6,0.6,1,0.8l0,0l0,0l0,0
	                        l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0
	                        l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0
	                        l0,0l0,0l0-0.1l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0
	                        l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0c0.4-1.2,0.7-2.7,0.7-4.6
	                        c0.1-2.4-0.1-5.1-0.7-7.2l0-0.1l0,0l0-0.1l0,0l0-0.1l0,0l0-0.1l0,0l0-0.1l0,0l0-0.1l0,0l0-0.1l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0
	                        l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0-0.1l0,0l0-0.1l0,0l0-0.1
	                        l0,0l0-0.1l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0
	                        l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l-0.1,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0l0,0
	                        l0,0l0,0l0,0l0,0c-0.3,0.2-0.7,0.4-1,0.6c-0.3,0.3-0.7,0.5-0.9,0.8c-0.9,1-1.6,2.1-2.3,3.3c-0.7,1.1-1.3,2.1-2,2.9
	                        c0.4,0.2,0.7,0.5,1,0.8C58.6,82.6,58.9,83.1,59.2,83.6z" />
                        </svg>
                    </svg>', 1, CAST(0x0000AC6000000000 AS DateTime), NULL)
INSERT [dbo].[Banner] ([banner_id], [banner_name], [banner_svg], [banner_active], [banner_datecreated], [banner_bin]) VALUES (6, N'THIẾT BỊ ĐIỆN TỬ', N'<svg class="navigate__icon navigate__icon--furniture">
                        <?xml version="1.0" encoding="utf-8" ?>
                        <!-- Generator: Adobe Illustrator 22.0.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                        <svg version="1.1" id="katman_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 114.1 107.9" style="enable-background:new 0 0 114.1 107.9;" xml:space="preserve">
                            <g id="_x34__2_">
                                <radialGradient id="SVGID_1_" cx="441.8826" cy="-3541.0391" r="25.7387" gradientTransform="matrix(0.3516 0 0 0.1009 -58.1296 413.8714)" gradientUnits="userSpaceOnUse">
                                    <stop offset="0" style="stop-color:#9EADB8" />
                                    <stop offset="1" style="stop-color:#FFFFFF" />
	                            </radialGradient>
                                <path class="st0v" d="M106.3,56.6c0,1.4-4.1,2.6-9,2.6c-5,0-9-1.2-9-2.6c0-1.4,4.1-2.6,9-2.6C102.2,54,106.3,55.1,106.3,56.6z" />
                                <g id="_x32__1_">
                                    <rect x="99.5" y="46.7" class="st1" width="6" height="2.3" />
                                    <rect x="99.5" y="50.4" class="st1" width="6" height="2.3" />
                                    <path class="st2v" d="M103.3,27.5v28.2c0,0.9-0.7,1.6-1.6,1.6h-9.3c-0.9,0-1.6-0.7-1.6-1.6V27.5c0-0.9,0.7-1.6,1.6-1.6h9.3
			                        C102.6,25.9,103.3,26.6,103.3,27.5z" />
                                    <path class="st1v" d="M103.3,53.2v2.5c0,0.9-0.7,1.6-1.6,1.6h-9.3c-0.9,0-1.6-0.7-1.6-1.6v-2.5H103.3z" />
                                    <path class="st1v" d="M101.8,40.1c0,4.8-2.1,8.7-4.7,8.7c-2.6,0-4.7-3.9-4.7-8.7s2.1-8.7,4.7-8.7C99.7,31.4,101.8,35.3,101.8,40.1z" />
                                    <path class="st3v" d="M98.3,40.1c0,1.3-0.6,2.3-1.3,2.3c-0.7,0-1.3-1-1.3-2.3c0-1.3,0.6-2.3,1.3-2.3C97.8,37.8,98.3,38.8,98.3,40.1z" />
	                            </g>
                            </g>
                            <g id="_x37__2_">
                                <g>
                                    <g>
                                        <g>
                                            <polygon class="st4v" points="62,50.5 56.1,49.7 50.2,50.5 49.8,52.8 62.4,52.8 				" />
                                            <polygon class="st5v" points="62.4,52.8 49.8,52.8 48.6,59.6 63.6,59.6 				" />
                                            <path class="st6v" d="M70.1,61.9l-0.7-1.1c-0.8-0.6-5.7-0.9-5.7-0.9l0,0l-0.1-0.3h-15L48.5,60l0,0c0,0-4.8,0.3-5.7,0.9l-0.7,1.1
					                        c-0.3,0.2,0,0.5,0.5,0.5h13.5h13.5C70.1,62.4,70.4,62.1,70.1,61.9z" />
			                            </g>
                                        <g>
                                            <g>
                                                <path class="st6v" d="M87.7,10.2H24.5c-0.1,0-0.2,0.1-0.2,0.2v39.9c0,0.1,0.1,0.2,0.2,0.2h63.2c0.1,0,0.2-0.1,0.2-0.2V10.5
						                        C88,10.4,87.9,10.2,87.7,10.2z" />
                                                <rect x="27.6" y="13" class="st7" width="56.9" height="34.8" />
				                            </g>
			                            </g>
		                            </g>
                                    <path class="st3v" d="M28.5,13.7c0,3,0,18.6,0,27.5L56,13.7C48.3,13.7,40.5,13.7,28.5,13.7z" />
                                    <path class="st8v" d="M56,13.7L28.5,41.3c0,2.7,0,4.8,0,5.7c0.7,0,1.5,0,2.2,0L64,13.7C61.2,13.7,58.6,13.7,56,13.7z" />
                                    <path class="st3v" d="M79.3,13.7c-6,0-10.9,0-15.3,0L30.7,47c5.7,0,10.7,0,15.3,0L79.3,13.7z" />
                                    <path class="st8v" d="M83.5,13.7c-1.5,0-2.9,0-4.2,0L46,47c2.7,0,5.3,0,7.9,0l29.6-29.6V13.7z" />
                                    <path class="st3v" d="M83.5,17.4L54,47c9,0,17.7,0,29.6,0V17.4z" />
                                    <radialGradient id="SVGID_2_" cx="64.2468" cy="-5648.3604" r="33.7397" gradientTransform="matrix(1.0792 0 0 6.270000e-02 -11.2799 416.7342)" gradientUnits="userSpaceOnUse">
                                        <stop offset="0" style="stop-color:#CFCFCF" />
                                        <stop offset="1" style="stop-color:#FFFFFF" />
	                                </radialGradient>
                                    <ellipse class="st9v" cx="58.1" cy="62.6" rx="36.4" ry="2.1" />
                                </g>
                            </g>
                            <g id="_x31_0">
                                <radialGradient id="SVGID_3_" cx="205.0301" cy="-3546.179" r="25.7387" gradientTransform="matrix(0.3516 0 0 0.1009 -58.1296 413.8714)" gradientUnits="userSpaceOnUse">
                                    <stop offset="0" style="stop-color:#9EADB8" />
                                    <stop offset="1" style="stop-color:#FFFFFF" />
	                            </radialGradient>
                                <path class="st10v" d="M23,56.1c0,1.4-4.1,2.6-9,2.6c-5,0-9-1.2-9-2.6c0-1.4,4.1-2.6,9-2.6C19,53.5,23,54.6,23,56.1z" />
                                <g id="_x33__8_">
                                    <path class="st2v" d="M20.8,26.8v28.2c0,0.9-0.7,1.6-1.6,1.6H9.9c-0.9,0-1.6-0.7-1.6-1.6V26.8c0-0.9,0.7-1.6,1.6-1.6h9.3
			                        C20.1,25.2,20.8,25.9,20.8,26.8z" />
                                    <path class="st1v" d="M20.8,52.5v2.5c0,0.9-0.7,1.6-1.6,1.6H9.9c-0.9,0-1.6-0.7-1.6-1.6v-2.5H20.8z" />
                                    <path class="st1v" d="M19.3,39.4c0,4.8-2.1,8.7-4.7,8.7c-2.6,0-4.7-3.9-4.7-8.7c0-4.8,2.1-8.7,4.7-8.7
			                        C17.2,30.8,19.3,34.7,19.3,39.4z" />
                                    <path class="st3v" d="M15.8,39.4c0,1.3-0.6,2.3-1.3,2.3c-0.7,0-1.3-1-1.3-2.3c0-1.3,0.6-2.3,1.3-2.3C15.3,37.1,15.8,38.2,15.8,39.4z" />
	                            </g>
                            </g>
                            <g id="_x32__9_">
                                <g>
                                    <g>
                                        <path class="st11v" d="M101.5,72.9L101.5,72.9c-4.2,0-7.3,2.6-7.2,5.5c0.1,2.1,0.1,4.3,0,6.4c-0.2,2.9,3,5.5,7.2,5.5l0,0
				                        c4.2,0,7.3-2.6,7.2-5.5c-0.1-2.1-0.1-4.3,0-6.4C108.8,75.5,105.7,72.9,101.5,72.9z" />
                                        <path class="st12v" d="M103.2,86.1c0,0.7-0.7,1.2-1.7,1.2c-0.9,0-1.7-0.5-1.7-1.2c0-0.7,0.7-1.2,1.7-1.2
				                        C102.4,84.9,103.2,85.4,103.2,86.1z" />
		                            </g>
                                    <path class="st13v" d="M101.5,74.3c-0.9,0-1.7,0.3-1.7,0.8v2.3c0,0.4,0.8,0.8,1.7,0.8c0.9,0,1.7-0.3,1.7-0.8v-2.3
			                        C103.2,74.6,102.4,74.3,101.5,74.3z" />
                                    <path class="st13v" d="M101.5,78.9c-0.4,0-0.8,0.2-0.8,0.4v1.3c0,0.2,0.4,0.4,0.8,0.4c0.4,0,0.8-0.2,0.8-0.4v-1.3
			                        C102.3,79.1,101.9,78.9,101.5,78.9z" />
                                    <path class="st6v" d="M101.5,74.3c-0.6,0-1.1,0.3-1.1,0.8v2.3c0,0.4,0.5,0.8,1.1,0.8c0.6,0,1.1-0.3,1.1-0.8v-2.3
			                        C102.6,74.6,102.1,74.3,101.5,74.3z" />
                                    <path class="st6v" d="M101.5,78.9c-0.3,0-0.5,0.2-0.5,0.4v1.3c0,0.2,0.2,0.4,0.5,0.4c0.3,0,0.5-0.2,0.5-0.4v-1.3
			                        C102,79.1,101.8,78.9,101.5,78.9z" />
	                            </g>
                            </g>
                            <g id="_x31_6_2_">
                                <g>
                                    <g>
                                        <g>
                                            <g><path class="st6v" d="M0.9,75.4L7,90.7c0.4,1,1.6,1.6,2.6,1.3l11.1-2.8c1-0.3,1.6-1.3,1.2-2.3l-6.1-15.2c-0.4-1-1.6-1.6-2.6-1.3
						                    L2.1,73.1C1.1,73.4,0.5,74.4,0.9,75.4z" /></g>
                                            <g>
                                                <g><polygon class="st3v" points="14.1,72.4 2.8,75.2 7.9,88.1 15.4,75.7 						" /></g>
                                                <g><polygon class="st1v" points="19.2,85.3 15.4,75.7 7.9,88.1 8,88.2 						" /></g>
				                            </g>
			                            </g>
                                        <g><path class="st14v" d="M14.2,88.2c0.6-0.1,1.2,0.1,1.4,0.6c0.2,0.5-0.1,1-0.7,1.1c-0.6,0.1-1.2-0.1-1.4-0.6
					                    C13.3,88.9,13.6,88.4,14.2,88.2z" /></g>
                                        <g><path class="st15v" d="M7.5,72.9c-0.1,0-0.2,0-0.3-0.1c0-0.1,0-0.2,0.1-0.2l1.9-0.5h0c0.1,0,0.2,0,0.3,0.1c0,0.1,0,0.2-0.1,0.2
					                    L7.5,72.9L7.5,72.9z" /></g>
                                        <g><path class="st15v" d="M6.7,73.7c-0.1,0-0.2,0-0.3-0.1c0-0.1,0-0.2,0.1-0.2l3.4-0.9h0c0.1,0,0.2,0,0.3,0.1c0,0.1,0,0.2-0.1,0.2
					                    L6.7,73.7L6.7,73.7z" /></g>
		                            </g>
                                    <g><path class="st15v" d="M4.9,73.3c0.3-0.1,0.6,0.1,0.7,0.3S5.5,74,5.2,74.1c-0.3,0.1-0.6-0.1-0.7-0.3S4.6,73.4,4.9,73.3z" /></g>
	                            </g>
                            </g>
                            <g id="_x33__9_">
                                <g>
                                    <path class="st16v" d="M82.1,73.2l4.2,17.1c0.2,0.7-0.4,1.5-1.4,1.6L35,100.2c-0.9,0.2-1.8-0.3-2-1l-4.2-17.1
			                        c-0.1-0.4,0.2-0.7,0.7-0.8l51.7-8.7C81.6,72.6,82,72.8,82.1,73.2z" />
                                    <g>
                                        <path class="st11v" d="M36.5,96.4l-2.3,0.4c-0.3,0-0.4,0.3-0.4,0.5l0.5,1.9c0.1,0.2,0.3,0.3,0.6,0.3l2.3-0.4
				                        c0.3,0,0.4-0.3,0.4-0.5l-0.5-1.9C37.1,96.5,36.8,96.4,36.5,96.4z" />
                                        <path class="st11v" d="M40.2,95.8l-2.3,0.4c-0.3,0-0.4,0.3-0.4,0.5l0.5,1.9c0,0.1,0.1,0.2,0.2,0.2c0.1,0.1,0.2,0.1,0.4,0.1
				                        l2.3-0.4c0.3,0,0.4-0.3,0.4-0.5l-0.5-1.9C40.8,95.9,40.5,95.8,40.2,95.8z" />
                                        <path class="st11v" d="M44,95.2l-2.3,0.4c-0.1,0-0.2,0.1-0.3,0.2c-0.1,0.1-0.1,0.2-0.1,0.3l0.5,1.9c0.1,0.2,0.3,0.3,0.6,0.3
				                        l2.3-0.4c0.1,0,0.2-0.1,0.3-0.2c0.1-0.1,0.1-0.2,0.1-0.3l-0.5-1.9C44.5,95.3,44.2,95.1,44,95.2z" />
                                        <path class="st11v" d="M47.7,94.6L45.3,95c-0.3,0-0.4,0.3-0.4,0.5l0.5,1.9c0.1,0.2,0.3,0.3,0.6,0.3l2.3-0.4c0.3,0,0.4-0.3,0.4-0.5
				                        l-0.5-1.9c0-0.1-0.1-0.2-0.2-0.2C47.9,94.6,47.8,94.6,47.7,94.6z" />
                                        <path class="st11v" d="M65.6,91.6l-16.3,2.7c-0.3,0-0.5,0.3-0.4,0.5l0.5,1.9c0,0.1,0.1,0.2,0.2,0.3c0.1,0.1,0.3,0.1,0.4,0.1
				                        l16.3-2.7c0.3,0,0.5-0.3,0.4-0.5l-0.5-1.9c0-0.1-0.1-0.2-0.2-0.3C65.9,91.6,65.7,91.6,65.6,91.6z" />
                                        <path class="st11v" d="M32.6,91l4-0.7c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3l-4,0.7c-0.2,0-0.4,0.2-0.3,0.4
				                        l0.4,1.6C32.2,90.9,32.4,91,32.6,91z" />
                                        <path class="st11v" d="M40,89.7c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3L40,89.7z" />
                                        <path class="st11v" d="M41.6,89.5l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6C41.2,89.4,41.4,89.5,41.6,89.5z" />
                                        <path class="st11v" d="M45.2,88.9l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6C44.8,88.8,45,88.9,45.2,88.9z" />
                                        <path class="st11" d="M48.8,88.3l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4L50.7,86c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0L48.2,86
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2C48.6,88.3,48.7,88.3,48.8,88.3z" />
                                        <path class="st11v" d="M52.4,87.7l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2C52.1,87.7,52.3,87.7,52.4,87.7z" />
                                        <path class="st11v" d="M55.1,85c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3
				                        c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3C55.3,84.9,55.2,84.9,55.1,85z" />
                                        <path class="st11v" d="M58.7,84.4c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3
				                        c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3L59,84.3C58.9,84.3,58.8,84.3,58.7,84.4z" />
                                        <path class="st11v" d="M62.3,83.8c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3
				                        c0.2,0,0.4-0.2,0.3-0.4L65,83.6c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3C62.4,83.7,62.3,83.8,62.3,83.8z" />
                                        <path class="st11v" d="M65.8,83.2c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3
				                        c0.2,0,0.4-0.2,0.3-0.4L68.5,83c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3C66,83.1,65.9,83.2,65.8,83.2z" />
                                        <path class="st11v" d="M70.2,84.7l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3
				                        l-1.9,0.3c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6C69.8,84.7,70,84.8,70.2,84.7z" />
                                        <path class="st11v" d="M75.7,83.8c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3
				                        c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3L75.7,83.8z" />
                                        <path class="st11v" d="M79.3,83.2c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3L79.3,83.2z" />
                                        <path class="st11v" d="M82.3,80.4l-1.9,0.3c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.2,0.3,0.3,0.5,0.2
				                        l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6C82.7,80.5,82.5,80.4,82.3,80.4z" />
                                        <path class="st11v" d="M32.9,91.5c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3l4.8-0.8c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6
				                        c0-0.2-0.3-0.3-0.5-0.3L32.9,91.5z" />
                                        <path class="st11v" d="M39.6,92.7l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3L39,90.4
				                        c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6C39.1,92.6,39.4,92.7,39.6,92.7z" />
                                        <path class="st11v" d="M43.2,92.1l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2L45,89.8c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3
				                        c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6C42.7,92,42.9,92.1,43.2,92.1z" />
                                        <path class="st11v" d="M48.9,91c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3l1.9-0.3C48.8,91.1,48.9,91.1,48.9,91z" />
                                        <path class="st11v" d="M52.5,90.4c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3l1.9-0.3C52.3,90.6,52.4,90.5,52.5,90.4z" />
                                        <path class="st11v" d="M56.1,89.8c0.1-0.1,0.1-0.2,0.1-0.2L55.8,88c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3l1.9-0.3C55.9,90,56,89.9,56.1,89.8z" />
                                        <path class="st11v" d="M59.7,89l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6
				                        c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3C59.6,89.3,59.8,89.2,59.7,89z" />
                                        <path class="st11v" d="M63.3,88.4l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6
				                        c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3C63.2,88.8,63.3,88.6,63.3,88.4z" />
                                        <path class="st11v" d="M66.9,87.8l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6
				                        c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3C66.8,88.2,66.9,88,66.9,87.8z" />
                                        <path class="st11v" d="M70.4,87.2L70,85.6c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2
				                        l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3C70.3,87.6,70.5,87.4,70.4,87.2z" />
                                        <path class="st11v" d="M71.9,87.3l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2L73.8,85c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6C71.5,87.2,71.7,87.3,71.9,87.3z" />
                                        <path class="st11v" d="M75.5,86.7l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6C75,86.6,75.3,86.8,75.5,86.7z" />
                                        <path class="st11v" d="M82.9,83.2l-4.6,0.8c-0.1,0-0.2,0.1-0.3,0.1C78,84.1,78,84.2,78,84.3l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3
				                        l4.5-0.7c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2C83.1,83.2,83,83.1,82.9,83.2z" />
                                        <path class="st11v" d="M43.3,92.5l-1.9,0.3c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2
				                        c0.1,0,0.2,0.1,0.3,0l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6C43.8,92.6,43.6,92.5,43.3,92.5z" />
                                        <path class="st11v" d="M39.9,93.1l-6.4,1.1c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l6.4-1.1
				                        c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6C40.4,93.2,40.2,93,39.9,93.1z" />
                                        <path class="st11v" d="M45.5,94.5l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3L45,92.2c-0.1,0-0.2,0.1-0.3,0.1
				                        c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2C45.3,94.5,45.4,94.5,45.5,94.5z" />
                                        <path class="st11v" d="M49.1,93.9l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2L51,91.6c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3
				                        c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6C48.6,93.8,48.9,93.9,49.1,93.9z" />
                                        <path class="st11v" d="M52.7,93.3l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2L54.5,91c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3
				                        c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6C52.2,93.2,52.4,93.3,52.7,93.3z" />
                                        <path class="st11v" d="M56.2,92.7l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6C55.8,92.6,56,92.7,56.2,92.7z" />
                                        <path class="st11v" d="M59.8,92.1l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6C59.4,92,59.6,92.1,59.8,92.1z" />
                                        <path class="st11v" d="M63.4,91.5l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6C62.9,91.4,63.2,91.6,63.4,91.5z" />
                                        <path class="st11v" d="M67,90.9l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2
				                        c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6C66.5,90.8,66.7,91,67,90.9z" />
                                        <path class="st11v" d="M72.5,90c0.2,0,0.4-0.2,0.3-0.4L72.4,88c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0L70,88.1
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0L72.5,90z" />
                                        <path class="st11v" d="M76.6,89l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2
				                        l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3C76.5,89.3,76.7,89.2,76.6,89z" />
                                        <path class="st11v" d="M83.6,85.8l-6,1c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.3l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3l5.9-1
				                        c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6C84,85.9,83.8,85.8,83.6,85.8z" />
                                        <path class="st11" d="M31.9,88.2l1.7-0.3c0.2,0,0.3-0.2,0.3-0.3l-0.4-1.7c0-0.2-0.2-0.3-0.4-0.2L31.3,86c-0.2,0-0.3,0.2-0.3,0.3
				                        l0.4,1.7C31.5,88.1,31.7,88.2,31.9,88.2z" />
                                        <path class="st11v" d="M34.3,85.8l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6
				                        c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3C34.4,85.5,34.3,85.6,34.3,85.8z" />
                                        <path class="st11v" d="M40.7,86.7c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0L40.7,86.7z" />
                                        <path class="st11v" d="M41.5,84.4c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3
				                        c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3C41.7,84.3,41.6,84.3,41.5,84.4z" />
                                        <path class="st11v" d="M45.4,83.6c-0.1,0-0.2,0.1-0.3,0.1C45,83.9,45,83.9,45,84l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2
				                        c0.1,0,0.2,0.1,0.3,0l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3L45.4,83.6z" />
                                        <path class="st11v" d="M49.5,85.3l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4L51.4,83c0-0.2-0.3-0.3-0.5-0.3l-1.9,0.3c-0.1,0-0.2,0.1-0.3,0.1
				                        c-0.1,0.1-0.1,0.2-0.1,0.2L49,85c0,0.1,0.1,0.2,0.2,0.2C49.3,85.3,49.4,85.3,49.5,85.3z" />
                                        <path class="st11v" d="M53.1,84.7l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3
				                        l-1.9,0.3c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6C52.6,84.6,52.8,84.7,53.1,84.7z" />
                                        <path class="st11v" d="M58,81.5l-1.9,0.3c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3l1.9-0.3
				                        c0.1,0,0.2-0.1,0.3-0.1c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6C58.5,81.6,58.2,81.5,58,81.5z" />
                                        <path class="st11v" d="M61.6,81l-1.9,0.3c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.2,0.3,0.3,0.5,0.3l1.9-0.3c0.1,0,0.2-0.1,0.3-0.1
				                        c0.1-0.1,0.1-0.2,0.1-0.2l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2C61.8,81,61.7,80.9,61.6,81z" />
                                        <path class="st11" d="M63,81.1l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6
				                        c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3C63.1,80.7,62.9,80.9,63,81.1z" />
                                        <path class="st11v" d="M69.3,82c0.2,0,0.4-0.2,0.3-0.4L69.3,80c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0L69.3,82z" />
                                        <path class="st11v" d="M71,81.7l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.1-0.1-0.2-0.2-0.2c-0.1,0-0.2-0.1-0.3,0l-1.9,0.3
				                        c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2C70.8,81.7,70.9,81.7,71,81.7z" />
                                        <path class="st11v" d="M74.2,81.1c0.1,0,0.2,0.1,0.3,0l1.9-0.3c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6c0-0.2-0.3-0.3-0.5-0.3L74,78.9
				                        c-0.1,0-0.2,0.1-0.3,0.1c-0.1,0.1-0.1,0.2-0.1,0.2l0.4,1.6C74.1,81,74.2,81,74.2,81.1z" />
                                        <path class="st11v" d="M81.6,77.6l-4,0.7c-0.2,0-0.4,0.2-0.3,0.4l0.4,1.6c0,0.1,0.1,0.2,0.2,0.2c0.1,0,0.2,0.1,0.3,0l4-0.7
				                        c0.2,0,0.4-0.2,0.3-0.4l-0.4-1.6C82,77.7,81.8,77.6,81.6,77.6z" />
                                        <path class="st11v" d="M69.4,91L67,91.4c-0.3,0-0.4,0.3-0.4,0.5l0.5,1.9c0,0.1,0.1,0.2,0.2,0.2c0.1,0.1,0.2,0.1,0.4,0.1l2.3-0.4
				                        c0.3,0,0.4-0.3,0.4-0.5l-0.5-1.9C69.9,91.1,69.6,90.9,69.4,91z" />
                                        <path class="st11v" d="M73.4,90.3l-2.3,0.4c-0.1,0-0.2,0.1-0.3,0.2c-0.1,0.1-0.1,0.2-0.1,0.3l0.5,1.9c0.1,0.2,0.3,0.3,0.6,0.3
				                        l2.3-0.4c0.3,0,0.4-0.3,0.4-0.5L74,90.6C74,90.4,73.7,90.3,73.4,90.3z" />
                                        <path class="st11v" d="M78.1,91.2l-2.9,0.5c-0.1,0-0.1,0-0.1,0.1s0,0.1,0,0.1l0.2,0.7c0,0.1,0.1,0.1,0.2,0.1l2.9-0.5
				                        c0.1,0,0.1,0,0.1-0.1c0,0,0-0.1,0-0.1l-0.2-0.7C78.3,91.3,78.2,91.2,78.1,91.2z" />
                                        <path class="st11v" d="M31.2,85.4l2.9-0.5c0.1,0,0.2-0.1,0.2-0.2L34,84c0-0.1-0.1-0.1-0.2-0.1l-2.9,0.5c-0.1,0-0.2,0.1-0.2,0.2
				                        l0.2,0.7c0,0,0,0.1,0.1,0.1C31,85.4,31.1,85.4,31.2,85.4z" />
                                        <path class="st11v" d="M35.5,84.7l2.9-0.5c0.1,0,0.1,0,0.1-0.1c0,0,0-0.1,0-0.1l-0.2-0.7c0-0.1-0.1-0.1-0.2-0.1l-2.9,0.5
				                        c-0.1,0-0.1,0-0.1,0.1s0,0.1,0,0.1l0.2,0.7C35.3,84.7,35.4,84.7,35.5,84.7z" />
                                        <path class="st11v" d="M39.8,84l2.9-0.5c0.1,0,0.1,0,0.1-0.1c0,0,0-0.1,0-0.1l-0.2-0.7c0-0.1-0.1-0.1-0.2-0.1l-2.9,0.5
				                        c-0.1,0-0.2,0.1-0.2,0.2l0.2,0.7C39.6,83.9,39.7,84,39.8,84z" />
                                        <path class="st11v" d="M44.2,83.2l2.9-0.5c0.1,0,0.2-0.1,0.2-0.2l-0.2-0.7c0,0,0-0.1-0.1-0.1c0,0-0.1,0-0.1,0l-2.9,0.5
				                        c-0.1,0-0.1,0-0.1,0.1c0,0,0,0.1,0,0.1l0.2,0.7C44,83.2,44.1,83.3,44.2,83.2z" />
                                        <path class="st11v" d="M48.5,82.5l2.9-0.5c0.1,0,0.1,0,0.1-0.1c0,0,0-0.1,0-0.1l-0.2-0.7c0-0.1-0.1-0.1-0.2-0.1l-2.9,0.5
				                        c-0.1,0-0.1,0-0.1,0.1c0,0,0,0.1,0,0.1l0.2,0.7C48.3,82.5,48.4,82.5,48.5,82.5z" />
                                        <path class="st11v" d="M52.9,81.8l2.9-0.5c0.1,0,0.2-0.1,0.2-0.2l-0.2-0.7c0-0.1-0.1-0.1-0.2-0.1l-2.9,0.5c-0.1,0-0.2,0.1-0.2,0.2
				                        l0.2,0.7C52.7,81.7,52.8,81.8,52.9,81.8z" />
                                        <path class="st11v" d="M57.2,81.1l2.9-0.5c0.1,0,0.1,0,0.1-0.1c0,0,0-0.1,0-0.1l-0.2-0.7c0-0.1-0.1-0.1-0.2-0.1L57,80
				                        c-0.1,0-0.1,0-0.1,0.1c0,0,0,0.1,0,0.1l0.2,0.7C57,81,57.1,81.1,57.2,81.1z" />
                                        <path class="st11v" d="M61.6,80.4l2.9-0.5c0.1,0,0.2-0.1,0.2-0.2L64.5,79c0-0.1-0.1-0.1-0.2-0.1l-2.9,0.5c-0.1,0-0.2,0.1-0.2,0.2
				                        l0.2,0.7C61.4,80.3,61.5,80.4,61.6,80.4z" />
                                        <path class="st11v" d="M66,79.6l2.9-0.5c0.1,0,0.1,0,0.1-0.1c0,0,0-0.1,0-0.1l-0.2-0.7c0-0.1-0.1-0.1-0.2-0.1l-2.9,0.5
				                        c-0.1,0-0.1,0-0.1,0.1c0,0,0,0.1,0,0.1l0.2,0.7C65.7,79.6,65.8,79.7,66,79.6z" />
                                        <path class="st11v" d="M70.3,78.9l2.9-0.5c0.1,0,0.2-0.1,0.2-0.2l-0.2-0.7c0,0,0-0.1-0.1-0.1c0,0-0.1,0-0.1,0l-2.9,0.5
				                        c-0.1,0-0.2,0.1-0.2,0.2l0.2,0.7C70.1,78.9,70.2,78.9,70.3,78.9z" />
                                        <path class="st11v" d="M74.7,78.2l2.9-0.5c0.1,0,0.1,0,0.1-0.1c0,0,0-0.1,0-0.1l-0.2-0.7c0-0.1-0.1-0.1-0.2-0.1l-2.9,0.5
				                        c-0.1,0-0.2,0.1-0.2,0.2l0.2,0.7c0,0,0,0.1,0.1,0.1C74.5,78.2,74.6,78.2,74.7,78.2z" />
                                        <path class="st11v" d="M81.4,76L79,76.4c-0.1,0-0.2,0.1-0.2,0.2l0.2,0.7c0,0.1,0.1,0.1,0.2,0.1l2.4-0.4c0.1,0,0.2-0.1,0.2-0.2
				                        l-0.2-0.7C81.6,76.1,81.5,76,81.4,76z" />
                                        <path class="st11v" d="M81.6,90.7l-2.9,0.5c-0.1,0-0.2,0.1-0.2,0.2l0.2,0.7c0,0.1,0.1,0.1,0.2,0.1l2.9-0.5c0.1,0,0.2-0.1,0.2-0.2
				                        l-0.2-0.7C81.9,90.7,81.8,90.6,81.6,90.7z" />
                                        <path class="st11v" d="M84.8,90.1l-2.5,0.4c-0.1,0-0.2,0.1-0.2,0.2l0.2,0.7c0,0,0,0.1,0.1,0.1c0,0,0.1,0,0.1,0l2.5-0.4
				                        c0.1,0,0.1,0,0.1-0.1c0,0,0-0.1,0-0.1l-0.2-0.7C85,90.2,84.9,90.1,84.8,90.1z" />
                                        <path class="st11v" d="M81.2,89l-2.9,0.5c-0.1,0-0.2,0.1-0.2,0.2l0.2,0.7c0,0.1,0.1,0.1,0.2,0.1l2.9-0.5c0.1,0,0.1,0,0.1-0.1
				                        c0,0,0-0.1,0-0.1l-0.2-0.7C81.5,89.1,81.4,89,81.2,89z" />
		                            </g>
                                    <polygon class="st12v" points="82.1,73 82.5,74.8 29.2,83.8 28.7,82 		" />
	                            </g>
                            </g>
                        </svg>
                    </svg>', 1, CAST(0x0000AC6000000000 AS DateTime), NULL)
INSERT [dbo].[Banner] ([banner_id], [banner_name], [banner_svg], [banner_active], [banner_datecreated], [banner_bin]) VALUES (7, N'THIẾT BỊ GIA DỤNG', N'<svg class="navigate__icon navigate__icon--carries">
                        <?xml version="1.0" encoding="utf-8" ?>
                        <!-- Generator: Adobe Illustrator 22.0.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                        <svg version="1.1" id="katman_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 114.1 107.9" style="enable-background:new 0 0 114.1 107.9;" xml:space="preserve">
                            <g id="_x34__1_">
                                <radialGradient id="SVGID_1_" cx="57.7566" cy="-1765.5652" r="21.246" gradientTransform="matrix(1.5385 0 0 0.1819 -55.6725 363.5132)" gradientUnits="userSpaceOnUse">
                                    <stop offset="0" style="stop-color:#9EADB8" />
                                    <stop offset="1" style="stop-color:#FFFFFF" />
	                            </radialGradient>
                                <path class="st0n" d="M65.9,42.4c0,2.1-14.6,3.9-32.7,3.9S0.5,44.6,0.5,42.4c0-2.1,14.6-3.9,32.7-3.9S65.9,40.3,65.9,42.4z" />
                                <g id="_x35__5_">
                                    <g><path class="st1n" d="M59.2,19.1l-1.9-2.3c-0.2,0.7-0.7,1.7-1.4,2.7c-1.5,2-3.5,2.7-4.4,2.9c3,0.5,5.9,1,8.9,1.5L59.2,19.1z" /></g>
                                    <g><polygon class="st2n" points="59.1,12.9 58.4,11.3 66.2,7.3 66.9,8.9 			" /></g>
                                    <g><polygon class="st3n" points="59.5,13.5 58,10.6 63.4,7.7 64.9,10.6 			" /></g>
                                    <g><path class="st4n" d="M57.9,6.7h1c1.5,0,2.7,1,3,2.5l4.7,23.2l-7.8-15.3L57.9,6.7z" /></g>
                                    <g><path class="st4n" d="M11.7,26.1l-2.2,0.3c-1.3,0.2-2.2,1.3-2,2.6l0.3,2.6l4-1V26.1z" /></g>
                                    <g><path class="st5n" d="M38.1,23.2c-0.6,0-1.1-0.4-1.2-1c-0.1-0.7,0.3-1.3,1-1.4l7.8-1.4c0.6-0.1,1.3,0.3,1.4,1
				                    c0.1,0.7-0.3,1.3-1,1.4l-7.8,1.4C38.3,23.2,38.2,23.2,38.1,23.2z" /></g>
                                    <g><path class="st5n" d="M27.2,21.6l4.7-1.2c1.7-0.4,2.8-2.2,2.4-4l-0.5-2.1l-6.6,6.1V21.6z" /></g>
                                    <g>
                                        <g><path class="st6n" d="M58.3,7.6c-0.6-1.6-2.2-2.7-3.9-2.7h-1.5c-15.5,0.8-30.8,8.9-35.1,13.8c-4.2,4.9-15,18.9-15,18.9
					                    c0.8,2.2,42.1,3.3,57.2,0.8c5.2-0.8,8.4-0.3,6.9-4.7C65.8,30.1,61,14.4,58.3,7.6z M28.5,25.8c0,0-3-3.4-0.3-5.7
					                    c8.5-8.8,27-8.4,27-8.4s0.8,2.5,2.4,6.3c0.5,1.4-0.4,2.9-1.8,3.1C47.5,22.1,28.5,25.8,28.5,25.8z" /></g>
                                        <g><path class="st6n" d="M67,33.7c-0.1-0.3-0.2-0.8-0.4-1.3c0-0.1,0-0.1-0.1-0.2c-0.1-0.4-0.3-0.9-0.5-1.5
					                    c-1.9-5.9-5.5-17.5-7.7-23.1c-0.6-1.6-2.2-2.7-3.9-2.7h-1.5c-15.5,0.8-30.8,8.9-35.1,13.8c-0.9,1-2,2.4-3.3,4
					                    c-3.2,4-7.2,9.1-9.6,12.2c-0.4,0.6-0.8,1-1.1,1.5c-0.6,0.8-1,1.2-1,1.2c0.2,0.5,3,1,7.2,1.4c12.7,1.1,38.6,1.3,50-0.6
					                    c2.3-0.4,4.3-0.5,5.5-0.9C67.2,37,67.8,36.1,67,33.7z M55.8,21.2c-8.3,0.9-27.2,4.7-27.2,4.7s-3-3.4-0.3-5.7
					                    c6.5-6.7,18.9-8.1,24.4-8.3c1.6-0.1,3,0.9,3.5,2.4c0.4,1,0.9,2.3,1.5,3.9C58.1,19.5,57.2,21,55.8,21.2z" /></g>
                                        <g><path class="st4n" d="M46.7,20.4L38.1,22c-1.3,0.2-2.2,1.3-2,2.4l13.7-2.2l-0.2-0.5C49.2,20.8,48,20.2,46.7,20.4z" /></g>
                                        <g><path class="st5n" d="M23.5,13.2v1.1l8.7-4.4L26,10.4C24.6,10.5,23.5,11.7,23.5,13.2z" /></g>
		                            </g>
                                    <g><path class="st4n" d="M65.6,37.5c-1.3,0.4-3.2,0.5-5.5,0.9c-11.3,1.9-37.3,1.7-50,0.6c1.5-1.8,3.2-3.8,5-5.5
				                    c0.4-0.4,0.8-0.7,1.2-1.1c2.5-2.3,5.1-3.9,7.2-3.8c2.7,0.1,10.7,1.8,19,3.6c1.3,0.3,2.7,0.6,4,0.9C55.5,35.1,64,37.1,65.6,37.5z" /></g>
                                    <g>
                                        <g><path class="st7n" d="M57.9,38.7c0,0-0.3,0.6-0.7,1.2c-0.3,0.5-0.6,1.1-0.9,1.6c-45.4,3.6-53.3-1.2-53.3-1.2v-2.7
					                    C3.7,39.7,41.3,40.8,57.9,38.7C57.9,38.7,57.9,38.7,57.9,38.7z" /></g>
                                        <g><path class="st5n" d="M67,33.7c-0.1-0.3-0.2-0.8-0.4-1.3C42.1,40,5,34.9,5,34.9c-0.4,0.6-0.8,1-1.1,1.5c-0.6,0.8-0.9,1.2-1,1.2
					                    l0,0c0.8,2.1,38.4,3.2,55,1.1c0.8-0.1,1.5-0.2,2.2-0.3C65.3,37.5,68.4,38.1,67,33.7z" /></g>
		                            </g>
                                    <g><path class="st4n" d="M53.7,4.9c-0.3,2.7-2.2,2.9-5.9,3.2C28.4,10.9,21.7,20,19.8,22c-1.4,1.4-3.9,1-5.2,0.7c1.3-1.6,2.4-3,3.3-4
				                    c4.2-4.9,19.5-12.9,35.1-13.8H53.7z" /></g>
                                    <g><path class="st4n" d="M53.7,26.1c0,1.2-1,2.2-2.2,2.2c-1.2,0-2.2-1-2.2-2.2s1-2.2,2.2-2.2C52.7,23.9,53.7,24.9,53.7,26.1z" /></g>
                                    <g><polygon class="st4n" points="55.5,33.8 55.1,31.9 62,30.7 62.4,32.6 			" /></g>
                                    <g><g><path class="st6n" d="M46.5,33.1c-5.4,0.4-12.9,0.5-19.5,0.5c-4.9,0-9.3-0.1-11.9-0.1c0.4-0.4,0.8-0.7,1.2-1.1
					                c5.9,0.1,17.6,0.2,26.3-0.2C43.8,32.5,45.2,32.8,46.5,33.1z" /></g></g>
                                    <g><path class="st8n" d="M57.1,40c-0.3,0.5-0.6,1.1-0.9,1.6c-45.4,3.6-53.3-1.2-53.3-1.2v-1.3c3.1,0.7,17,3.3,39.9,1.7
				                    C48.7,40.5,53.4,40.2,57.1,40z" /></g>
	                            </g>
                            </g>
                            <g id="_x33__1_">
                                <radialGradient id="SVGID_2_" cx="30.5421" cy="-1437.5688" r="21.2427" gradientTransform="matrix(0.9128 0 0 0.1091 25.4567 254.5598)" gradientUnits="userSpaceOnUse">
                                    <stop offset="0" style="stop-color:#9EADB8" />
                                    <stop offset="1" style="stop-color:#FFFFFF" />
	                            </radialGradient>
                                <path class="st9n" d="M72.7,97.7c0,1.3-8.7,2.3-19.4,2.3c-10.7,0-19.4-1-19.4-2.3c0-1.3,8.7-2.3,19.4-2.3
                                C64,95.4,72.7,96.4,72.7,97.7z" />
                                <g id="_x39__3_">
                                    <rect x="23.3" y="62.4" class="st10n" width="12.9" height="1.8" />
                                    <rect x="33.2" y="62" class="st6n" width="2" height="2.7" />
                                    <rect x="34.5" y="61.3" class="st3n" width="3.4" height="4.3" />
                                    <g>
                                        <path class="st10n" d="M7.6,69.4c-0.6,0-1.1-0.1-1.7-0.2c-4.3-1.2-4.2-5.2-4.2-5.9l0-0.1l0-0.1c0-0.7-0.2-4.8,4.3-5.9
				                        c0.5-0.1,1-0.2,1.6-0.2c8,0.2,11.2,1.9,12.4,3.3c0.9,1.1,0.8,2,0.8,2l-0.1,0.4l-0.4-0.2C16.3,60.9,12.7,60,9.6,60
				                        c-5.2,0-6.8,2.6-7.1,3.2c0.3,0.6,2,3.2,7.1,3.2c3,0,6.7-0.9,10.9-2.6l0.4-0.2l0.1,0.4c0,0,0.1,1-0.8,2c-1.2,1.4-4.4,3.1-12.4,3.3
				                        C7.7,69.4,7.7,69.4,7.6,69.4z M2.5,64.4c0.2,1.3,0.9,3.4,3.6,4.2c0.5,0.1,1,0.2,1.6,0.2c7.7-0.2,10.7-1.7,11.9-3
				                        c0.4-0.4,0.6-0.8,0.6-1.1c-4.1,1.6-7.6,2.5-10.6,2.5C5.5,67.1,3.4,65.5,2.5,64.4z M7.6,57.7c-0.4,0-0.9,0.1-1.3,0.2
				                        c-2.9,0.8-3.7,2.9-3.8,4.2c0.9-1.1,3-2.7,7.2-2.7c3,0,6.5,0.8,10.6,2.5c-0.1-0.3-0.3-0.7-0.6-1.1c-1.2-1.3-4.2-2.9-11.9-3
				                        C7.7,57.7,7.6,57.7,7.6,57.7z" />
		                            </g>
                                    <g><rect x="2.1" y="62.9" class="st10" width="18.5" height="0.7" /></g>
                                    <path class="st3n" d="M71.4,68L71.4,68c1.1,0,2,1,1.8,2.1l-0.7,3.4v6c0,0.6-0.3,1.2-0.8,1.5l-3.4,2.1l1.1-13.8L71.4,68z" />
                                    <path class="st1n" d="M70.8,65.4h-0.4v-6.1h0.4c1.6,0,2.8,1.3,2.8,2.8v0.5C73.6,64.1,72.3,65.4,70.8,65.4z" />
                                    <path class="st6n" d="M57.5,75.8c0-6.7,2-12.1,4.4-12.1c2.4,0,4.4,5.4,4.4,12.1c0,6.7-2,12.1-4.4,12.1
			                        C59.4,87.9,57.5,82.5,57.5,75.8z M69.6,55.9c-1.2-1.2-2.9-1.9-4.8-1.9H50.1c-1.2,0-2.9,0-4.6,0.2c-5.2,0.8-8.6,5.6-7.6,10.7
			                        l0.9,4.6l1.6,8.3c1.4,5.6,1,11.5-1.1,16.9l-0.3,0.7l0,0h29.2l0,0l0.2-1.1l0.3-1.9c1.9-10.5,2.8-21.1,2.8-31.7
			                        C71.6,58.8,70.8,57.1,69.6,55.9z" />
                                    <path class="st11n" d="M68.4,94.3l-0.2,1.1l0,0H39.1l0,0l0.3-0.7c2.1-5.4,2.4-11.3,1.1-16.9l-1.6-8.3c1.1,2,2.4,3.9,3.7,5.8
			                        c5.3,7.8,12.5,15.4,22,18.1C65.8,93.7,67.1,94,68.4,94.3z" />
                                    <path class="st6n" d="M66.9,97.6H40.4c-1.2,0-1.9-1.2-1.5-2.2l0,0h29.4l0,0C68.8,96.4,68.1,97.6,66.9,97.6z" />
                                    <g>
                                        <path class="st3n" d="M42.4,57.9c-0.5,0-0.9,0.4-0.9,0.8v8.1c0,0.4,0.4,0.8,0.9,0.8c0.5,0,0.9-0.4,0.9-0.8v-8.1
				                        C43.3,58.3,42.9,57.9,42.4,57.9z" />
                                        <path class="st3n" d="M45.5,57.9c-0.5,0-0.9,0.4-0.9,0.8v8.1c0,0.4,0.4,0.8,0.9,0.8c0.5,0,0.9-0.4,0.9-0.8v-8.1
				                        C46.4,58.3,46,57.9,45.5,57.9z" />
                                        <path class="st3n" d="M48.6,57.9c-0.5,0-0.9,0.4-0.9,0.8v8.1c0,0.4,0.4,0.8,0.9,0.8c0.5,0,0.9-0.4,0.9-0.8v-8.1
				                        C49.5,58.3,49.1,57.9,48.6,57.9z" />
                                        <path class="st3n" d="M51.8,57.9c-0.5,0-0.9,0.4-0.9,0.8v8.1c0,0.4,0.4,0.8,0.9,0.8c0.5,0,0.9-0.4,0.9-0.8v-8.1
				                        C52.7,58.3,52.3,57.9,51.8,57.9z" />
		                            </g>
                                    <path class="st11n" d="M61.9,60.5c-3.9,0-7.1,6.8-7.1,15.3c0,8.4,3.2,15.3,7.1,15.3S69,84.2,69,75.8C69,67.4,65.8,60.5,61.9,60.5z
			                        M61.8,87.9c-2.4,0-4.4-5.4-4.4-12.1c0-6.7,2-12.1,4.4-12.1c2.4,0,4.4,5.4,4.4,12.1C66.2,82.5,64.3,87.9,61.8,87.9z" />
                                    <path class="st6n" d="M23.1,64.9l-2.5,0.5v-4.3l2.5,0.5c0.8,0.2,1.4,0.9,1.4,1.6l0,0C24.5,64,24,64.7,23.1,64.9z" />
                                    <rect x="42.3" y="69.8" class="st3" width="9.6" height="2.6" />
	                            </g>
                            </g>
                            <g id="_x36__1_">
                                <radialGradient id="SVGID_3_" cx="78.34" cy="-2301.8179" r="21.1731" gradientTransform="matrix(0.8363 0 0 8.907290e-02 28.4383 271.1585)" gradientUnits="userSpaceOnUse">
                                    <stop offset="0" style="stop-color:#9EADB8" />
                                    <stop offset="1" style="stop-color:#FFFFFF" />
	                            </radialGradient>
                                <path class="st12n" d="M111.7,66.1c0,1-7.9,1.9-17.7,1.9s-17.7-0.8-17.7-1.9c0-1,7.9-1.9,17.7-1.9S111.7,65.1,111.7,66.1z" />
                                <g id="_x31_5_3_">
                                    <g>
                                        <rect x="88.3" y="5.6" class="st13" width="11" height="2.1" />
                                        <path class="st14n" d="M100.2,6.1H87.3c-0.4,0-0.7-0.3-0.7-0.7l0,0c0-0.4,0.3-0.7,0.7-0.7h12.9c0.4,0,0.7,0.3,0.7,0.7l0,0
				                        C101,5.8,100.6,6.1,100.2,6.1z" />
		                            </g>
                                    <polygon class="st13n" points="77.5,10.7 81.5,9.1 84.3,14.3 		" />
                                    <path class="st14" d="M81,10.7h-3.5c0,0,2,3.9,4,4.8C84.2,16.6,81,10.7,81,10.7z" />
                                    <g><path class="st14n" d="M107.3,32.6h-5.4V30h5.4c0.2,0,0.5-0.1,0.6-0.3c0.2-0.2,0.2-0.4,0.2-0.6l-0.7-11.8c0-0.4-0.4-0.8-0.9-0.8
				                    l-2.3,0l0.8-2.7h1.6c1.8,0,3.4,1.4,3.5,3.3l0.7,11.8c0.1,1-0.3,1.9-0.9,2.6C109.2,32.2,108.2,32.6,107.3,32.6z" /></g>
                                    <g>
                                        <path class="st13n" d="M110.8,28.9L110,17.1c-0.1-1.8-1.7-3.3-3.5-3.3h-0.2l-0.3,2.6l0.6,0c0.5,0,0.8,0.4,0.9,0.8l0.7,11.8
				                        c0,0.2-0.1,0.5-0.2,0.6c-0.2,0.2-0.4,0.3-0.6,0.3h-3.1l-0.3,2.6h3.4c1,0,1.9-0.4,2.6-1.1C110.5,30.8,110.8,29.9,110.8,28.9z" />
                                        <polygon class="st13n" points="101.8,30 101.8,32.6 103.9,32.6 104.2,30 			" />
                                        <polygon class="st13n" points="105,13.8 104.2,16.5 106,16.5 106.3,13.8 			" />
		                            </g>
                                    <polygon class="st13n" points="84,35.4 84.3,37.6 102.3,37.6 102.5,35.4 		" />
                                    <polygon class="st14n" points="103.5,12.6 101.1,35.4 84,35.4 81.3,12.6 		" />
                                    <polygon class="st13n" points="105.3,12.6 103.5,12.6 101.1,35.4 102.5,35.4 		" />
                                    <polygon class="st15n" points="107.2,62.8 79.4,62.8 84.3,37.6 102.3,37.6 		" />
                                    <path class="st16n" d="M93,56.7c-4.9,0-8.3-3.7-7.7-7.7L87,37.6h12l1.7,11.4C101.3,52.9,97.9,56.7,93,56.7z" />
                                    <path class="st17n" d="M95.4,42.3h-4.3c-0.8,0-1.5-0.7-1.5-1.5l0,0c0-0.8,0.7-1.5,1.5-1.5h4.3c0.8,0,1.5,0.7,1.5,1.5l0,0
			                        C96.9,41.6,96.3,42.3,95.4,42.3z" />
                                    <g>
                                        <path class="st15n" d="M97.7,49.2c0,2.5-2,4.5-4.5,4.5c-2.5,0-4.5-2-4.5-4.5s2-4.5,4.5-4.5C95.6,44.7,97.7,46.7,97.7,49.2z" />
                                        <g>
                                            <path class="st17n" d="M93.2,45.4L93.2,45.4c-0.4,0-0.8,0.3-0.8,0.8v1h1.5v-1C93.9,45.8,93.6,45.4,93.2,45.4z" />
                                            <g><path class="st8n" d="M92.4,47.2v5c0,0.4,0.3,0.8,0.8,0.8h0c0.4,0,0.8-0.3,0.8-0.8v-5H92.4z" /></g>
			                            </g>
		                            </g>
                                    <path class="st2n" d="M103.5,7.1H83.1c-1.3,0-2.3,1.1-2.2,2.4v0h24.7v0C105.8,8.3,104.8,7.1,103.5,7.1z" />
                                    <polygon class="st15n" points="80.9,9.6 81.3,12.6 105.3,12.6 105.6,9.6 		" />
                                    <path class="st15n" d="M103.7,66.2H82.9c-1.9,0-3.5-1.5-3.5-3.5l0,0h27.8l0,0C107.2,64.7,105.6,66.2,103.7,66.2z" />
                                    <rect x="86.7" y="59.3" class="st16" width="12.7" height="2.2" />
                                    <polygon class="st18n" points="90.6,12.6 82.7,12.6 85.2,35.4 90.6,35.4 		" />
                                    <polygon class="st18n" points="90.6,37.6 89.4,62.8 79.4,62.8 84.3,37.6 		" />
                                    <polygon class="st18n" points="99.1,12.6 97.8,35.4 94.9,35.4 96.1,12.6 		" />
                                    <path class="st17n" d="M89,44.7c0,0.4-0.3,0.7-0.7,0.7c-0.4,0-0.7-0.3-0.7-0.7c0-0.4,0.3-0.7,0.7-0.7C88.7,44,89,44.3,89,44.7z" />
	                            </g>
                            </g>
                            <g></g><g></g><g></g><g></g>
                        </svg>
                    </svg>', 1, CAST(0x0000AC6000000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1, N'Thiết Bị Điện Tử', NULL, CAST(0x0000AC5B016C00DB AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (2, N'Phụ Kiện Điện Tử', N'vanchuyen.jpg', CAST(0x0000AC5B016C00DB AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (3, N'TV & Thiết Bị Điện Tử Gia Dụng', N'keogo.png', CAST(0x0000AC5B016C5351 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1002, N'Sức Khỏe & Làm Đẹp', N'nhan8.jpg', CAST(0x0000AC5D00ACC6D6 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1003, N'Hàng, Bé & Đồ Chơi', N'nhan7.jpg', CAST(0x0000AC5D00AD1347 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1004, N'Siêu Thị Tạp Hóa', N'giay.png', CAST(0x0000AC5E00DB8345 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1005, N'Hàng Gia Dụng & Đời Sống', NULL, CAST(0x0000AC5E00DB8345 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1006, N'Thời Trang Nữ', NULL, CAST(0x0000AC5E00DB8345 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1007, N'Thời Trang Nam', NULL, CAST(0x0000AC5E00DB8345 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1008, N'Phụ Kiện Thời Trang', NULL, CAST(0x0000AC5E00DB8345 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1009, N'Thể Thao & Du Lịch', NULL, CAST(0x0000AC5E00DB8345 AS DateTime), 1, 1)
INSERT [dbo].[Category] ([category_id], [category_name], [category_image], [category_datecreated], [category_active], [category_bin]) VALUES (1010, N'Ôtô, Xe Máy & Thiết Bị Định Vị', NULL, CAST(0x0000AC5E00DB8345 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ClassificationSubCategory] ON 

INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1, N'Laptop cơ bản', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 3, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (2, N'Laptop chơi game', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 3, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (3, N'Dòng 2 trong 1', NULL, CAST(0x0000AC5E00000000 AS DateTime), 1, 3, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1003, N'Máy tính để bàn', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1002, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1004, N'Máy tính để bàn chơi game', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1002, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1005, N'Máy tính tự ráp', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1002, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1006, N'Các loại tai nghe', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1007, N'Loa di đọng', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1008, N'Âm thanh tại nhà', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1009, N'Thiết bị Audio chyên nghiệp', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1010, N'Thiết bị DJ', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1011, N'Máy đọc đĩa than', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1012, N'Phụ kiện tai nghe', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1013, N'Phụ kiện loa di động', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1014, N'Phụ kiện âm thanh tại nhà', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1015, N'Phụ kiện thiết bị âm thanh', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1016, N'Thiết bị âm thanh di động', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1003, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1017, N'Camera IP kết nối internet', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1004, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1018, N'Camera an ninh CCTV', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1004, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1019, N'Hệ thống an ninh IP', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1004, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1020, N'Hệ thống an ninh CCTV', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1004, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1021, N'Camera chống trộm', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1004, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1022, N'Máy ảnh DSLR', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1023, N'Máy ảnh không gương', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1024, N'Máy ảnh du lịch', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1025, N'Máy ảnh siêu zoom', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1026, N'Máy bay camera', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1027, N'Máy chụp lấy ngay & Phụ kiện', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1028, N'Ống kính', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1029, N'Ống nhòm', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1030, N'Các loạt máy ảnh khác & Phụ kiện', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1005, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1031, N'Camera thể thao & Hành động', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1006, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1032, N'Máy quay phim', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1006, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1033, N'Máy quay phim chuyên nghiệp', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1006, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1034, N'Camera 360', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1006, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1035, N'Máy quay dưới nước', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1006, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1036, N'Máy in', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1008, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1037, N'Máy Scan', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1008, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1038, N'Máy fax', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1008, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1039, N'Máy in 3D', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1008, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1040, N'Máy in cắt', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1008, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1041, N'Mực máy in', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1008, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1042, N'Bộ nhớ máy in', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1008, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1043, N'Đồng hồ thông minh', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1009, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1044, N'Đồng hồ thông minh trẻ em', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1009, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1045, N'Đồng hồ thông minh thiết kế', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1009, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1046, N'Máy chơi game', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1010, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1047, N'Trò chơi máy console', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1010, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1048, N'Tai nghe chơi game', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1010, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1049, N'Ốp lưng & bao da máy tính bảng', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1010, 1)
INSERT [dbo].[ClassificationSubCategory] ([csc_id], [csc_name], [csc_image], [csc_datecreate], [csc_active], [subcategory_id], [csc_bin]) VALUES (1050, N'Miếng dán màn hình điện thoại', NULL, CAST(0x0000AC5E013D071F AS DateTime), 1, 1010, 1)
SET IDENTITY_INSERT [dbo].[ClassificationSubCategory] OFF
SET IDENTITY_INSERT [dbo].[Collection] ON 

INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (1, N'Croptop Nữ Ulzzang', N'croptop1.jpg', N'croptop2.jpg', N'croptop3.jpg', CAST(0x0000AC620159EC59 AS DateTime), 1, 1, 9)
INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (2, N'Giày Sneaker nữ', N'giay1.jpg', N'giay2.jpg', N'giay3.jpg', CAST(0x0000AC4400000000 AS DateTime), 1, 1, NULL)
INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (3, N'Đồ Nam Mới Về < 99k', N'dobonam.jpg', N'sominam.jpg', N'aokhoacnam.jpg', CAST(0x0000AC4400000000 AS DateTime), 1, 1, NULL)
INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (4, N'# NEW Đồng Hồ Thông Minh', N'dongho1.jpg', N'dongho2.jpg', N'dongho3.jpg', CAST(0x0000AC4400000000 AS DateTime), 1, 1, NULL)
INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (5, N'Tía Ơi, Con Độ Xế Nha', N'xe1.jpg', N'xe2.jpg', N'xe3.jpg', CAST(0x0000AC4400000000 AS DateTime), 1, 1, NULL)
INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (6, N'Đồ Dùng Tiện Lợi', N'dodung1.jpg', N'dodung2.jpg', N'dodung3.jpg', CAST(0x0000AC4400000000 AS DateTime), 1, 1, NULL)
INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (7, N'# NEW Quần Áo Nam', N'khoacnam1.jpg', N'khoacnam2.jpg', N'khoacnam3.jpg', CAST(0x0000AC4400000000 AS DateTime), 1, 1, NULL)
INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (8, N'Quạt Máy Gió', N'quat1.jpg', N'quat2.jpg', N'quat3.jpg', CAST(0x0000AC62015BCD8E AS DateTime), 1, 1, NULL)
INSERT [dbo].[Collection] ([collection_id], [collection_name], [collection_image1], [collection_image2], [collection_image3], [collection_datecreate], [collection_active], [collection_bin], [seller_id]) VALUES (19, N'Trang sức bạc', N'cty3.png', N'cty4.png', N'cty5.png', CAST(0x0000AC7100E32D6F AS DateTime), 0, 0, 9)
SET IDENTITY_INSERT [dbo].[Collection] OFF
SET IDENTITY_INSERT [dbo].[Favourite] ON 

INSERT [dbo].[Favourite] ([fa_id], [fa_datereated], [fa_bin], [product_id], [user_id]) VALUES (41, CAST(0x0000AC7C0174CF90 AS DateTime), 0, 4, 1)
SET IDENTITY_INSERT [dbo].[Favourite] OFF
SET IDENTITY_INSERT [dbo].[GSMall] ON 

INSERT [dbo].[GSMall] ([gsmall_id], [gsmall_name], [gsmall_slogan], [gsmall_active], [gsmall_datecreate], [gsmall_bg], [gsmall_image], [gsmall_bin], [gsmall_img1], [gsmall_img2], [gsmall_img3], [gsmall_img4], [gsmall_img5], [gsmall_img6], [gsmall_img7]) VALUES (1, N'Bobbi Brown', N'Gian Hàng Chính Hãng', 1, CAST(0x0000AC4400000000 AS DateTime), N'gs_bg1.jpg', N'gs1.jpg', 1, N'3ce.jpg', N'innisfree.jpg', N'kissbeauty.jpg', N'laneila.jpg', N'mac.jpg', N'maybelline.jpg', N'sacelady.jpg')
INSERT [dbo].[GSMall] ([gsmall_id], [gsmall_name], [gsmall_slogan], [gsmall_active], [gsmall_datecreate], [gsmall_bg], [gsmall_image], [gsmall_bin], [gsmall_img1], [gsmall_img2], [gsmall_img3], [gsmall_img4], [gsmall_img5], [gsmall_img6], [gsmall_img7]) VALUES (2, N'GUTEK - Siêu Thị Điện Tử', N'GUTEK', 1, CAST(0x0000AC4400000000 AS DateTime), N'gs_bg2.jpg', N'gs2.jpg', 1, N'3ce.jpg', N'innisfree.jpg', N'innisfree.jpg', N'innisfree.jpg', N'innisfree.jpg', N'innisfree.jpg', N'innisfree.jpg')
INSERT [dbo].[GSMall] ([gsmall_id], [gsmall_name], [gsmall_slogan], [gsmall_active], [gsmall_datecreate], [gsmall_bg], [gsmall_image], [gsmall_bin], [gsmall_img1], [gsmall_img2], [gsmall_img3], [gsmall_img4], [gsmall_img5], [gsmall_img6], [gsmall_img7]) VALUES (3, N'cocoepps store', N'cocoepps store', 1, CAST(0x0000AC4400000000 AS DateTime), N'gs_bg3.jpg', N'gs3.jpg', 1, N'3ce.jpg', N'innisfree.jpg', N'kissbeauty.jpg', N'laneila.jpg', N'mac.jpg', N'maybelline.jpg', N'sacelady.jpg')
INSERT [dbo].[GSMall] ([gsmall_id], [gsmall_name], [gsmall_slogan], [gsmall_active], [gsmall_datecreate], [gsmall_bg], [gsmall_image], [gsmall_bin], [gsmall_img1], [gsmall_img2], [gsmall_img3], [gsmall_img4], [gsmall_img5], [gsmall_img6], [gsmall_img7]) VALUES (4, N'Laneige', N'Gian Hàng Chính Hãng', 1, CAST(0x0000AC4400000000 AS DateTime), N'gs_bg4.jpg', N'gs4.jpg', 1, N'3ce.jpg', N'innisfree.jpg', N'kissbeauty.jpg', N'laneila.jpg', N'mac.jpg', N'maybelline.jpg', N'sacelady.jpg')
INSERT [dbo].[GSMall] ([gsmall_id], [gsmall_name], [gsmall_slogan], [gsmall_active], [gsmall_datecreate], [gsmall_bg], [gsmall_image], [gsmall_bin], [gsmall_img1], [gsmall_img2], [gsmall_img3], [gsmall_img4], [gsmall_img5], [gsmall_img6], [gsmall_img7]) VALUES (5, N'miDoctor Official', N'miDoctor Official', 1, CAST(0x0000AC4400000000 AS DateTime), N'gs_bg5.jpg', N'gs5.jpg', 1, N'3ce.jpg', N'innisfree.jpg', N'kissbeauty.jpg', N'laneila.jpg', N'mac.jpg', N'maybelline.jpg', N'sacelady.jpg')
INSERT [dbo].[GSMall] ([gsmall_id], [gsmall_name], [gsmall_slogan], [gsmall_active], [gsmall_datecreate], [gsmall_bg], [gsmall_image], [gsmall_bin], [gsmall_img1], [gsmall_img2], [gsmall_img3], [gsmall_img4], [gsmall_img5], [gsmall_img6], [gsmall_img7]) VALUES (6, N'Công ty TNHH Grown Tech (tp.HCM)', N'Công ty TNHH Grown Tech', 1, CAST(0x0000AC4400000000 AS DateTime), N'gs_bg6.jpg', N'gs6.jpg', 1, N'3ce.jpg', N'innisfree.jpg', N'kissbeauty.jpg', N'laneila.jpg', N'mac.jpg', N'maybelline.jpg', N'sacelady.jpg')
INSERT [dbo].[GSMall] ([gsmall_id], [gsmall_name], [gsmall_slogan], [gsmall_active], [gsmall_datecreate], [gsmall_bg], [gsmall_image], [gsmall_bin], [gsmall_img1], [gsmall_img2], [gsmall_img3], [gsmall_img4], [gsmall_img5], [gsmall_img6], [gsmall_img7]) VALUES (9, N'Jewelly', N'Bạc chính hãng', 0, CAST(0x0000AC6300DAC73C AS DateTime), N'bst9.jpg', N'bst8.jpg', 0, N'3ce.jpg', N'innisfree.jpg', N'kissbeauty.jpg', N'laneila.jpg', N'mac.jpg', N'maybelline.jpg', N'sacelady.jpg')
SET IDENTITY_INSERT [dbo].[GSMall] OFF
SET IDENTITY_INSERT [dbo].[Like] ON 

INSERT [dbo].[Like] ([like_id], [like_datecreated], [like_bin], [product_id], [replycomment_id], [user_id], [comment_id]) VALUES (7, CAST(0x0000AC7701000155 AS DateTime), 1, 6, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Like] OFF
SET IDENTITY_INSERT [dbo].[PayDetail] ON 

INSERT [dbo].[PayDetail] ([pay_id], [user_id], [product_id], [pay_money], [pay_amount], [pay_datecreated]) VALUES (11, 1, 2, 222222.0000, 1, CAST(0x0000AC7C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[PayDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (1, N'Áo khoác nam', N'aokhoac.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, 61, 5, NULL, NULL, N'Áo khoác', N'Vải kaki', 1, 100000.0000, 234, CAST(0x0000AC6200000000 AS DateTime), 8, 1, 1, 3, 1, 2, 1, 2, NULL, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2, N'Áo len', N'aolen.jpg', CAST(0x0000AC3D00000000 AS DateTime), 0, NULL, 200000.0000, 1, 58, 10, NULL, NULL, NULL, NULL, 1, 159000.0000, 1236, CAST(0x0000AC6200000000 AS DateTime), 9, 1, 1, 2, 1, 1, 0, 2, NULL, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (3, N'Gấu bông', N'gaubong.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 100000.0000, 1, 84, 1, NULL, NULL, NULL, NULL, 1, 80000.0000, 1212, CAST(0x0000AC6200000000 AS DateTime), 10, 1, 1007, 2, 1, 1, 1, 2, NULL, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (4, N'Kệ lưới', N'ke.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 250000.0000, 1, 397, 3, NULL, NULL, NULL, NULL, 1, 200000.0000, 4356, CAST(0x0000AC6200000000 AS DateTime), 8, 1, 1007, 7, 1, 1, 1, 3, NULL, 1028)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (5, N'Keo sữa', N'keosua.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 60000.0000, 1, 461, 2, NULL, NULL, NULL, NULL, 1, 57000.0000, 12123, CAST(0x0000AC6200000000 AS DateTime), 8, 1, NULL, 5, 1, 2, 1, 3, NULL, 1017)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (6, N'Tay cầm chơi game', N'maychoigame.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 70000.0000, 1, 101, 6, NULL, NULL, NULL, NULL, 1, 60000.0000, 1246, CAST(0x0000AC6200000000 AS DateTime), 8, 1, NULL, 7, 4, 2, 1, 3, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (7, N'Quạt mini', N'quat.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, 10, 7, NULL, NULL, NULL, NULL, 1, 100000.0000, 8985, CAST(0x0000AC6200000000 AS DateTime), 9, 1, NULL, 4, 4, 3, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (8, N'Son kem lì', N'son.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 200000.0000, 1, 122, 8, NULL, NULL, NULL, NULL, 1, 190000.0000, 233, CAST(0x0000AC6200000000 AS DateTime), 9, 1, NULL, 3, 4, 4, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (9, N'Tai nghe gaming', N'tainghe.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, 72, 4, NULL, NULL, NULL, NULL, 1, 100000.0000, 1214, CAST(0x0000AC6200000000 AS DateTime), 9, 1, NULL, 4, 4, 3, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (10, N'Tivi SAMSUNG', N'tivi.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, 42, 11, NULL, NULL, NULL, NULL, 1, 100000.0000, 3545, CAST(0x0000AC6200000000 AS DateTime), 10, 1, NULL, 6, 4, 3, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2008, N'Đồng hồ thông minh', N'dh1.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100000.0000, NULL, CAST(0x0000AC6200000000 AS DateTime), 10, 2, 1009, 1, 4, 4, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2009, N'Đồng hồ thông minh', N'dh2.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100000.0000, NULL, CAST(0x0000AC6200000000 AS DateTime), 10, 2, 1009, 1, 2, 4, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2010, N'Đồng hồ thông minh', N'dh3.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100000.0000, NULL, CAST(0x0000AC6200000000 AS DateTime), 10, 2, 1009, 1, 2, 6, 1, 1, NULL, 1014)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2011, N'Đồng hồ thông minh', N'dh4.jpg', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100000.0000, NULL, CAST(0x0000AC6200000000 AS DateTime), 10, 2, 1009, 1, 2, 6, 1, 1, NULL, 1014)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2012, N'Đồng hồ thông minh', N'dh5.jpg', CAST(0x0000AC6200000000 AS DateTime), 1, NULL, 120000.0000, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100000.0000, NULL, CAST(0x0000AC6200000000 AS DateTime), 10, 2, NULL, NULL, 2, 6, 1, 1, NULL, 1043)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2013, N'Đồng hồ thông minh', N'dh6.png', CAST(0x0000AC3D00000000 AS DateTime), 1, NULL, 120000.0000, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100000.0000, NULL, CAST(0x0000AC6200000000 AS DateTime), 10, 2, 1009, 1, 2, 5, 1, 1, NULL, 1043)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2016, N'Phụ kiện', N'pk1.jpg', CAST(0x0000AC6400B16C11 AS DateTime), 1, NULL, 200000.0000, 1, 17, 10, N'Bạc', N'16', NULL, NULL, 1, 160000.0000, 12, CAST(0x0000AC6400B16C11 AS DateTime), 9, 2, NULL, NULL, 5, 5, 1, 5, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2018, N'Kiềng', N'kieng2.jpg', CAST(0x0000AC6601184EDC AS DateTime), 0, N'<p>Bạc</p>', 200000.0000, 1, 10, 10, N'Bạc', N'16', N'<p>Bạc</p>', N'<p>Bạc 925</p>', 1, 160000.0000, 12, CAST(0x0000AC6601184EDC AS DateTime), 9, 2, NULL, NULL, 5, 5, 0, 5, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2021, N'Bạc', N'519kieng3.jpg', CAST(0x0000AC6F0106A24E AS DateTime), 0, NULL, 200000.0000, NULL, 10, 10, N'Bạc', N'16', NULL, NULL, 1, 160000.0000, 12, CAST(0x0000AC6F0106A24E AS DateTime), 9, 2, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_image], [product_datecreated], [product_active], [product_note], [product_price], [product_ship], [product_view], [product_love], [product_color], [product_size], [product_detail], [product_description], [product_option], [product_sale], [product_amount], [product_dateedit], [seller_id], [category_id], [subcategory_id], [banner_id], [collection_id], [gsmail_id], [product_bin], [product_related], [user_id], [csc_id]) VALUES (2022, N'Nhẫn', N'nhan10.jpg', CAST(0x0000AC7200ACF753 AS DateTime), 1, NULL, 200000.0000, NULL, 10, 10, N'Bạc', N'16', NULL, NULL, 1, 160000.0000, 12, CAST(0x0000AC7200ACF753 AS DateTime), 9, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ReplyComment] ON 

INSERT [dbo].[ReplyComment] ([replycomment_id], [replycomment_content], [product_id], [seller_id], [replycomment_spam], [replycomment_datecreated], [replycomment_bin], [user_id], [comment_id]) VALUES (9, N'ok', 1, 9, 1, CAST(0x0000AC6000000000 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ReplyComment] ([replycomment_id], [replycomment_content], [product_id], [seller_id], [replycomment_spam], [replycomment_datecreated], [replycomment_bin], [user_id], [comment_id]) VALUES (13, N'đẹp', 4, NULL, 1, CAST(0x0000AC7A0170D4CB AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ReplyComment] OFF
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([seller_id], [seller_pass], [seller_email], [seller_telephone], [seller_token], [seller_slider1], [seller_slider2], [seller_slider3], [seller_link1], [seller_link2], [seller_link3], [seller_logo], [seller_active], [seller_nameshop], [seller_datecreated], [seller_address], [seller_datelogin], [seller_detail], [seller_description], [seller_role], [seller_nicename], [seller_provincecity], [seller_district], [seller_bin]) VALUES (8, N'123', N'123@gmail.com', NULL, N'a6bb21c2-d5e1-493f-af7b-d8afbb36ec90', N'chan8.jpg', N'chan7.jpg', N'chan6.jpg', NULL, NULL, NULL, N'chan9.jpg', 1, NULL, CAST(0x0000AC640084281F AS DateTime), NULL, CAST(0x0000AC640084281F AS DateTime), N'<p>Hàng chính hãng</p>', N'<p>Hàng chính hãng</p>', 2, NULL, N'Chọn Tỉnh/Thành Phố', N'Chọn Quận/Huyện', 1)
INSERT [dbo].[Seller] ([seller_id], [seller_pass], [seller_email], [seller_telephone], [seller_token], [seller_slider1], [seller_slider2], [seller_slider3], [seller_link1], [seller_link2], [seller_link3], [seller_logo], [seller_active], [seller_nameshop], [seller_datecreated], [seller_address], [seller_datelogin], [seller_detail], [seller_description], [seller_role], [seller_nicename], [seller_provincecity], [seller_district], [seller_bin]) VALUES (9, N'1', N'vuongbaot1905@gmail.com', N'0869139879', N'd90e6d0e-3ba6-4b10-b872-db87a0fc03aa', N'pk4.jpg', N'pk5.jpg', N'pk6.jpg', NULL, NULL, NULL, N'pk3.jpg', 1, N'Trân Shop', CAST(0x0000AC6400B8951A AS DateTime), N'abc123', CAST(0x0000AC6400B8951A AS DateTime), N'Hàng chính hãng', N'Hàng chính hãng', 2, N'Trân ', N'Chọn Tỉnh/Thành Phố', N'Chọn Quận/Huyện', 1)
INSERT [dbo].[Seller] ([seller_id], [seller_pass], [seller_email], [seller_telephone], [seller_token], [seller_slider1], [seller_slider2], [seller_slider3], [seller_link1], [seller_link2], [seller_link3], [seller_logo], [seller_active], [seller_nameshop], [seller_datecreated], [seller_address], [seller_datelogin], [seller_detail], [seller_description], [seller_role], [seller_nicename], [seller_provincecity], [seller_district], [seller_bin]) VALUES (10, N'123', N'tran1999@gmail.com', N'0123567857', N'51a5a4c9-2ab3-412f-b2ff-74f1bb3d3404', N'charm4.jpg', N'charm2.jpg', N'charm7.jpg', NULL, NULL, NULL, N'charm6.jpg', 0, N'Trân nè', CAST(0x0000AC5F0113FDC3 AS DateTime), N'BD', CAST(0x0000AC5F0113FDC3 AS DateTime), NULL, NULL, 2, N'Trân', N'Chọn Tỉnh/Thành Phố', N'Chọn Quận/Huyện', 0)
INSERT [dbo].[Seller] ([seller_id], [seller_pass], [seller_email], [seller_telephone], [seller_token], [seller_slider1], [seller_slider2], [seller_slider3], [seller_link1], [seller_link2], [seller_link3], [seller_logo], [seller_active], [seller_nameshop], [seller_datecreated], [seller_address], [seller_datelogin], [seller_detail], [seller_description], [seller_role], [seller_nicename], [seller_provincecity], [seller_district], [seller_bin]) VALUES (11, N'123', N'trantran@gmail', N'0123567857', N'e4381974-61ce-4aef-800d-450d44948dfb', N'hoatay2.jpg', N'hoatay1.jpg', N'hoatay8.jpg', NULL, NULL, NULL, N'hoatay7.jpg', 1, N'Trân nè', CAST(0x0000AC60011D047B AS DateTime), N'BD', CAST(0x0000AC60011D047B AS DateTime), NULL, NULL, 2, N'Trân', N'Chọn Tỉnh/Thành Phố', N'Chọn Quận/Huyện', 1)
INSERT [dbo].[Seller] ([seller_id], [seller_pass], [seller_email], [seller_telephone], [seller_token], [seller_slider1], [seller_slider2], [seller_slider3], [seller_link1], [seller_link2], [seller_link3], [seller_logo], [seller_active], [seller_nameshop], [seller_datecreated], [seller_address], [seller_datelogin], [seller_detail], [seller_description], [seller_role], [seller_nicename], [seller_provincecity], [seller_district], [seller_bin]) VALUES (12, N'1', N'trantran7154@gmail', N'0123567857', N'77fd49d3-85fa-4391-923e-c618647b073c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'TT Shop', CAST(0x0000AC6E015616BF AS DateTime), NULL, CAST(0x0000AC6E015616BF AS DateTime), NULL, NULL, 2, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Seller] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1, N'Điện thoại di động', NULL, CAST(0x0000AC5E00000000 AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (2, N'Máy tính bảng', NULL, CAST(0x0000AC5E00000000 AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (3, N'Laptop', NULL, CAST(0x0000AC5E00000000 AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1002, N'Máy tính để bàn', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1003, N'Âm thanh', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1004, N'Camera giám sát', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1005, N'Máy ảnh kỷ thuật số', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1006, N'Máy quay phim', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1007, N'Máy hình vi tính', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1008, N'Máy in', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1009, N'Đồng hồ thông minh', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[SubCategory] ([subcategory_id], [subcategory_name], [subcategory_image], [subcategory_datecreated], [subcategory_active], [category_id], [subcategory_level], [subcategory_bin]) VALUES (1010, N'Máy chơi game', NULL, CAST(0x0000AC5E011FC03E AS DateTime), 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_datelogin], [user_active], [user_address], [user_telephone], [user_image], [user_provincecity], [user_district], [user_bin], [user_role]) VALUES (1, N'1', N'Tran', N'tran@gmail.com', CAST(0x0000AC7B00000000 AS DateTime), NULL, CAST(0x0000AC7B00000000 AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[ClassificationSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationSubCategory_SubCategory] FOREIGN KEY([subcategory_id])
REFERENCES [dbo].[SubCategory] ([subcategory_id])
GO
ALTER TABLE [dbo].[ClassificationSubCategory] CHECK CONSTRAINT [FK_ClassificationSubCategory_SubCategory]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_Collection_Seller1] FOREIGN KEY([seller_id])
REFERENCES [dbo].[Seller] ([seller_id])
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_Collection_Seller1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_Product]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_User]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[Comment] ([comment_id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Comment]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Product] FOREIGN KEY([user_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Product]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_ReplyComment] FOREIGN KEY([replycomment_id])
REFERENCES [dbo].[ReplyComment] ([replycomment_id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_ReplyComment]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_User1] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_User1]
GO
ALTER TABLE [dbo].[PayDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[PayDetail] CHECK CONSTRAINT [FK_PayDetail_Product]
GO
ALTER TABLE [dbo].[PayDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayDetail_User1] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[PayDetail] CHECK CONSTRAINT [FK_PayDetail_User1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Banner] FOREIGN KEY([banner_id])
REFERENCES [dbo].[Banner] ([banner_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Banner]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ClassificationSubCategory] FOREIGN KEY([csc_id])
REFERENCES [dbo].[ClassificationSubCategory] ([csc_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ClassificationSubCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection] FOREIGN KEY([collection_id])
REFERENCES [dbo].[Collection] ([collection_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Collection]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_GSMall1] FOREIGN KEY([gsmail_id])
REFERENCES [dbo].[GSMall] ([gsmall_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_GSMall1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Seller] FOREIGN KEY([seller_id])
REFERENCES [dbo].[Seller] ([seller_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Seller]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([subcategory_id])
REFERENCES [dbo].[SubCategory] ([subcategory_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User1] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User1]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_Comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[Comment] ([comment_id])
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_Comment]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_Product]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_Product1] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_Product1]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_Seller] FOREIGN KEY([seller_id])
REFERENCES [dbo].[Seller] ([seller_id])
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_Seller]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_User1] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_User1]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
USE [master]
GO
ALTER DATABASE [Data_GSShop] SET  READ_WRITE 
GO
