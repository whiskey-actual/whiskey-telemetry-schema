CREATE TABLE [dbo].[Employee] (
    [EmployeeID]                                INT             NOT NULL    IDENTITY(1,1),  
    EmployeeActiveDirectoryDN                   VARCHAR(255)    NOT NULL,
    EmployeeActiveDirectoryCN                   VARCHAR(255)    NULL,
    EmployeeActiveDirectorySN                   VARCHAR(255)    NULL,
    EmployeeActiveDirectoryCountry              VARCHAR(255)    NULL,
    EmployeeActiveDirectoryCity                 VARCHAR(255)    NULL,
    EmployeeActiveDirectoryState                VARCHAR(255)    NULL,
    EmployeeActiveDirectoryTitle                VARCHAR(255)    NULL,
    EmployeeActiveDirectoryOffice               VARCHAR(255)    NULL,
    EmployeeActiveDirectoryTelephoneNumber      VARCHAR(255)    NULL,
    EmployeeActiveDirectoryGivenName            VARCHAR(255)    NULL,
    EmployeeActiveDirectoryDisplayName          VARCHAR(255)    NULL,
    EmployeeActiveDirectoryDepartment           VARCHAR(255)    NULL,
    EmployeeActiveDirectoryStreetAddress        VARCHAR(255)    NULL,
    EmployeeActiveDirectoryUserName             VARCHAR(255)    NULL,
    EmployeeActiveDirectoryEmployeeID           VARCHAR(255)    NULL,
    EmployeeActiveDirectorySAMAccountName       VARCHAR(255)    NULL,
    EmployeeActiveDirectoryPrincipalName        VARCHAR(255)    NULL,
    EmployeeActiveDirectoryUserMail             VARCHAR(255)    NULL,
    EmployeeActiveDirectoryLogonCount           INT             NULL,
    EmployeeActiveDirectoryCreatedDate          DATETIME2       NULL,
    EmployeeActiveDirectoryChangedDate          DATETIME2       NULL,
    EmployeeActiveDirectoryBadPasswordTime      DATETIME2       NULL,
    EmployeeActiveDirectoryLastLogon            DATETIME2       NULL,
    EmployeeActiveDirectoryLastLogonTimestamp   DATETIME2       NULL,
    EmployeeActiveDirectoryLastSeen             DATETIME2       NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Employee_EmployeeActiveDirectoryDN ON Employee(EmployeeActiveDirectoryDN)
GO

SET IDENTITY_INSERT Employee ON
INSERT INTO Employee(EmployeeID, EmployeeActiveDirectoryDN) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT Employee OFF
GO