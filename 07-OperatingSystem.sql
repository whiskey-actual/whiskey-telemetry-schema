-- create table
CREATE TABLE [dbo].[OperatingSystem] (
    [OperatingSystemID]			            INT                 NOT NULL    IDENTITY(1,1),
    [OperatingSystemDescription]            VARCHAR(255)        NOT NULL,
    CONSTRAINT [PK_OperatingSystem] PRIMARY KEY CLUSTERED ([OperatingSystemID] ASC),
);
GO

-- add default/unknown row with ID 0
SET IDENTITY_INSERT OperatingSystem ON;
INSERT INTO OperatingSystem (OperatingSystemID, OperatingSystemDescription) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT OperatingSystem OFF;
GO

-- add index(es)
CREATE UNIQUE NONCLUSTERED INDEX IDX_OperatingSystem_OperatingSystemDescription ON OperatingSystem(OperatingSystemDescription);
GO


--------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[OperatingSystemVariant] (
    [OperatingSystemVariantID]              INT                 NOT NULL    IDENTITY(1,1),
    [OperatingSystemVariantDescription]     VARCHAR(255)        NOT NULL,
    [OperatingSystemID]                     INT                 NOT NULL    DEFAULT((0)),
    CONSTRAINT [PK_OperatingSystemVariant] PRIMARY KEY CLUSTERED ([OperatingSystemVariantID] ASC),
    CONSTRAINT [FK_OperatingSystemVariant_OperatingSystem] FOREIGN KEY (OperatingSystemID) REFERENCES OperatingSystem(OperatingSystemID)
);
GO

SET IDENTITY_INSERT OperatingSystemVariant ON;
INSERT INTO OperatingSystemVariant (OperatingSystemVariantID, OperatingSystemVariantDescription, OperatingSystemID) VALUES (0, 'UNKNOWN', 0)
SET IDENTITY_INSERT OperatingSystemVariant OFF;
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_OperatingSystemVariant_OperatingSystemVariantDescription ON OperatingSystemVariant(OperatingSystemVariantDescription);
GO

--------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[OperatingSystemVersion] (
    [OperatingSystemVersionID]              INT                 NOT NULL    IDENTITY(1,1),
    [OperatingSystemVersionDescription]     VARCHAR(255)        NOT NULL,
    [OperatingSystemVariantID]              INT                 NOT NULL    DEFAULT((0)), -- FK
    CONSTRAINT [PK_OperatingSystemVersion] PRIMARY KEY CLUSTERED ([OperatingSystemVersionID] ASC),
    CONSTRAINT [FK_OperatingSystemVariant] FOREIGN KEY (OperatingSystemVariantID) REFERENCES OperatingSystemVariant(OperatingSystemVariantID)
);
GO

SET IDENTITY_INSERT OperatingSystemVersion ON;
INSERT INTO OperatingSystemVersion (OperatingSystemVersionID, OperatingSystemVersionDescription, OperatingSystemVariantID) VALUES (0, 'UNKNOWN', 0)
SET IDENTITY_INSERT OperatingSystemVersion OFF;
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_OperatingSystemVersion_OperatingSystemVersionDescription ON OperatingSystemVersion(OperatingSystemVersionDescription);
GO