
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 15-Mar-17 10:27:06 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[AspNetRoles](

    [Id] [nvarchar](128) NOT NULL,

    [Name] [nvarchar](256) NOT NULL,

    [ConcurrencyStamp] [nvarchar](256) NULL,

    [NormalizedName] [nvarchar](256) NOT NULL

CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED

(

    [Id] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY]



GO

/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 15-Mar-17 10:27:06 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[AspNetUserClaims](

    [Id] [int] IDENTITY(1,1) NOT NULL,

    [UserId] [nvarchar](128) NOT NULL,

    [ClaimType] [nvarchar](max) NULL,

    [ClaimValue] [nvarchar](max) NULL,

CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED

(

    [Id] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



GO

/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 15-Mar-17 10:27:06 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[AspNetUserLogins](

    [LoginProvider] [nvarchar](128) NOT NULL,

    [ProviderKey] [nvarchar](128) NOT NULL,

    [UserId] [nvarchar](128) NOT NULL,

	[ProviderDisplayName] varchar(255) NULL,

CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED

(

    [LoginProvider] ASC,

    [ProviderKey] ASC,

    [UserId] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY]



GO

/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 15-Mar-17 10:27:06 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[AspNetUserRoles](

    [UserId] [nvarchar](128) NOT NULL,

    [RoleId] [nvarchar](128) NOT NULL,

CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED

(

    [UserId] ASC,

    [RoleId] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY]



GO

/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 15-Mar-17 10:27:06 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[AspNetUsers](

    [Id] [nvarchar](128) NOT NULL,

    [Email] [nvarchar](256) NULL,

    [EmailConfirmed] [bit] NOT NULL,

    [PasswordHash] [nvarchar](max) NULL,

    [SecurityStamp] [nvarchar](max) NULL,

    [PhoneNumber] [nvarchar](max) NULL,

    [PhoneNumberConfirmed] [bit] NOT NULL,

    [TwoFactorEnabled] [bit] NOT NULL,

    [LockoutEndDateUtc] [datetime] NULL,

    [LockoutEnabled] [bit] NOT NULL,

    [AccessFailedCount] [int] NOT NULL,

    [UserName] [nvarchar](256) NOT NULL,

	[NormalizedUserName] [nvarchar](256),

	[ConcurrencyStamp] [nvarchar](256) NULL,

	[LockoutEnd] [datetime] NULL,

	[NormalizedEmail] [nvarchar](256)

CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED

(

    [Id] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



GO

CREATE TABLE [dbo].[AspNetRoleClaims](
    [Id] [varchar](128) NOT NULL,
    [ClaimType] [varchar](100) NULL,
    [ClaimValue] [varchar](100) NULL,
    [RoleId] [varchar](50) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [AspNetUserTokens] (
    [UserId]        NVARCHAR (450) NOT NULL,
    [LoginProvider] NVARCHAR (450) NOT NULL,
    [Name]          NVARCHAR (450) NOT NULL,
    [Value]         NVARCHAR (900) NULL,
    CONSTRAINT [PK_AspNetUserTokens]
 PRIMARY KEY CLUSTERED ([UserId] ASC, [LoginProvider] ASC, [Name] ASC)
)

GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])

REFERENCES [dbo].[AspNetUsers] ([Id])

ON DELETE CASCADE

GO

ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]

GO

ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])

REFERENCES [dbo].[AspNetUsers] ([Id])

ON DELETE CASCADE

GO

ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]

GO

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])

REFERENCES [dbo].[AspNetRoles] ([Id])

ON DELETE CASCADE

GO

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]

GO

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])

REFERENCES [dbo].[AspNetUsers] ([Id])

ON DELETE CASCADE

GO

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]

GO


