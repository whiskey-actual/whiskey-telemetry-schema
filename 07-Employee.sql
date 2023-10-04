CREATE TABLE [dbo].[Employee] (
    [EmployeeID]                                INT             NOT NULL    IDENTITY(1,1),  
    EmployeeActiveDirectoryDN                   VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryCN                   VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectorySN                   VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryCountry              VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryCity                 VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryState                VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryTitle                VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryOffice               VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryTelephoneNumber      VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryGivenName            VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryDisplayName          VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryDepartment           VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryStreetAddress        VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryUserName             VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryEmployeeID           VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectorySAMAccountName       VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryPrincipalName        VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryUserMail             VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryLogonCount           INT             NOT NULL,
    EmployeeActiveDirectoryCreatedDate          DATETIME2       NOT NULL,
    EmployeeActiveDirectoryChangedDate          DATETIME2       NULL,
    EmployeeActiveDirectoryBadPasswordTime      DATETIME2       NULL,
    EmployeeActiveDirectoryLastLogon            DATETIME2       NULL,
    EmployeeActiveDirectoryLastLogonTimestamp   DATETIME2       NULL,
    CONSTRIANT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Employee_EmployeeActiveDirectoryDN ON Employee(EmployeeActiveDirectoryDN)
GO

SET IDENTITY_INSERT Employee ON
INSERT INTO Employee(EmployeeID, EmployeeEmailAddress) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT Employee OFF
GO