CREATE TABLE [dbo].[Employee] (
    EmployeeID                          INT             NOT NULL    IDENTITY(1,1),  
    
    EmployeeEmailAddress                VARCHAR(255)    NOT NULL,
    
    ad_DN                               VARCHAR(255)    NULL,
    ad_CN                               VARCHAR(255)    NULL,
    ad_SN                               VARCHAR(255)    NULL,
    ad_Country                          VARCHAR(255)    NULL,
    ad_City                             VARCHAR(255)    NULL,
    ad_State                            VARCHAR(255)    NULL,
    ad_Title                            VARCHAR(255)    NULL,
    ad_Office                           VARCHAR(255)    NULL,
    ad_TelephoneNumber                  VARCHAR(255)    NULL,
    ad_GivenName                        VARCHAR(255)    NULL,
    ad_DisplayName                      VARCHAR(255)    NULL,
    ad_Department                       VARCHAR(255)    NULL,
    ad_StreetAddress                    VARCHAR(255)    NULL,
    ad_UserName                         VARCHAR(255)    NULL,
    ad_EmployeeID                       VARCHAR(255)    NULL,
    ad_SAMAccountName                   VARCHAR(255)    NULL,
    ad_PrincipalName                    VARCHAR(255)    NULL,
    ad_UserMail                         VARCHAR(255)    NULL,
    ad_LogonCount                       INT             NULL,
    ad_CreatedDate                      DATETIME2       NULL,
    ad_ChangedDate                      DATETIME2       NULL,
    ad_BadPasswordTime                  DATETIME2       NULL,
    ad_LastLogon                        DATETIME2       NULL,
    ad_LastLogonTimestamp               DATETIME2       NULL,
    ad_LastSeen                         DATETIME2       NULL,

    aad_UserPrincipalName               VARCHAR(255)    NULL,
    aad_Id                              VARCHAR(255)    NULL,
    aad_BusinessPhone                   VARCHAR(255)    NULL,
    aad_BisplayName                     VARCHAR(255)    NULL,
    aad_GivenName                       VARCHAR(255)    NULL,
    aad_JobTitle                        VARCHAR(255)    NULL,
    aad_MobilePhone                     VARCHAR(255)    NULL,
    aad_OfficeLocation                  VARCHAR(255)    NULL,
    aad_Surname                         VARCHAR(255)    NULL,
    aad_AccountEnabled                  VARCHAR(255)    NULL,
    aad_AssignedPlans                   VARCHAR(255)    NULL,
    aad_City                            VARCHAR(255)    NULL,
    aad_Country                         VARCHAR(255)    NULL,
    aad_CreationType                    VARCHAR(255)    NULL,
    aad_Department                      VARCHAR(255)    NULL,
    aad_EmployeeHireDate                VARCHAR(255)    NULL,
    aad_EmployeeId                      VARCHAR(255)    NULL,
    aad_EmployeeOrgData                 VARCHAR(255)    NULL,
    aad_EmployeeType                    VARCHAR(255)    NULL,
    aad_OnPremisesDistinguishedName     VARCHAR(255)    NULL,
    aad_OnPremisesDomainName            VARCHAR(255)    NULL,
    aad_OnPremisesSamAccountName        VARCHAR(255)    NULL,
    aad_OnPremisesUserPrincipalName     VARCHAR(255)    NULL,
    aad_PasswordPolicies                VARCHAR(255)    NULL,
    aad_PostalCode                      VARCHAR(255)    NULL,
    aad_State                           VARCHAR(255)    NULL,
    aad_StreetAddress                   VARCHAR(255)    NULL,
    aad_UserType                        VARCHAR(255)    NULL,
    aad_CreatedDateTime                 DATETIME2       NULL,
    aad_DeletedDateTime                 DATETIME2       NULL,
    aad_LastPasswordChangeDateTime      DATETIME2       NULL,


    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Employee_EmployeeEmailAddress ON Employee(EmployeeEmailAddress)
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Employee_ad_DN ON Employee(ad_DN) WHERE ad_DN IS NOT NULL
GO

CREATE UNIQUE NONCLUSTERED INDEX IDX_Employee_ad_DN ON Employee(aad_Id) WHERE ad_DN IS NOT NULL
GO

SET IDENTITY_INSERT Employee ON
INSERT INTO Employee(EmployeeID, EmployeeEmailAddress) VALUES (0, 'UNKNOWN')
SET IDENTITY_INSERT Employee OFF
GO