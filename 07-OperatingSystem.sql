-- create table
CREATE TABLE [dbo].[OperatingSystem] (
    [OperatingSystemID]			            INT                 NOT NULL    IDENTITY(1,1),
    [OperatingSystemDescription]            VARCHAR(255)        NOT NULL,
    [OperatingSystemVersionMajor]           INT                 NULL,
    [OperatingSystemVersionMinor]           INT                 NULL,
    [OperatingSystemBuild]                  INT                 NULL,
    [OperatingSystemRevision]               INT                 NULL,
    [OperatingSystemNormalizedID]           INT                 NULL,
    CONSTRAINT [PK_OperatingSystem] PRIMARY KEY CLUSTERED ([OperatingSystemID] ASC),
);
GO

-- add default/unknown row with ID 0
SET IDENTITY_INSERT OperatingSystem ON;
INSERT INTO OperatingSystem (OperatingSystemID, OperatingSystemDescription) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT OperatingSystem OFF;

-- add index(es)
CREATE UNIQUE NONCLUSTERED INDEX IDX_OperatingSystem_Complex_01 ON OperatingSystem(
    OperatingSystemDescription,
    OperatingSystemVersionMajor,
    OperatingSystemVersionMinor,
    OperatingSystemBuild
);
GO