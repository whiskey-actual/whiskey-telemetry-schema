CREATE TABLE [dbo].[License] (
    LicenseID                          INT             NOT NULL    IDENTITY(1,1),  
    LicensePlanID                       VARCHAR(255)    NOT NULL,
    LicenseDescription                  VARCHAR(255)    NULL,
    CONSTRAINT [PK_License] PRIMARY KEY CLUSTERED ([LicenseID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_License_LicensePlanID ON License(LicensePlanID)
GO

CREATE TABLE [dbo].[EmployeeLicense] (
    EmployeeLicenseID                   INT             NOT NULL    IDENTITY(1,1),
    EmployeeID                          INT             NOT NULL,
    LicenseID                           INT             NOT NULL,
    AssignmentDateTime                  DATETIME2       NULL,
    AssignmentStatus                    VARCHAR(255)    NULL,
    CONSTRAINT [PK_EmployeeLicense] PRIMARY KEY CLUSTERED ([EmployeeLicenseID] ASC)
)

CREATE NONCLUSTERED INDEX IDX_EmployeeLicense_EmployeeID ON EmployeeLicense(EmployeeID)
GO

CREATE NONCLUSTERED INDEX IDX_EmployeeLicense_LicenseID ON EmployeeLicense(LicenseID)
GO