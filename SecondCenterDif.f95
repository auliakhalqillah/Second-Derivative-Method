! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c SecondCenterDif.f95
! gfortran -o SecondCenterDif SecondCenterDif.o
!
! The program is open source and can use be to numerical study purpose.
! The program was written by Aulia Khalqillah,S.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================
PROGRAM CenterDifference
  IMPLICIT NONE

  REAL :: A,B,H,X,RAWF,F
  REAL,DIMENSION(1000) :: RAWFS,FA,FX,XS,RES

  INTEGER :: I,N
  CHARACTER(len=100) :: FMT

  WRITE(*,*)""
  WRITE(*,*)"---------------------------------------------"
  WRITE(*,*)"CENTER DIFFERENCE METHOD - SECOND DERIVATIVE"
  WRITE(*,*)"---------------------------------------------"
  WRITE(*,*) ""
  WRITE(*,"(a)",advance="no") "INSERT INITIAL BOUNDARY:"
  READ *, A
  WRITE(*,"(a)",advance="no") "INSERT FINAL BOUNDARY:"
  READ *, B
  WRITE(*,"(a)",advance="no") "INSERT DATA LENGTH:"
  READ *, N

  FMT = "(a12,a13,a20,a20,a15,a13)"
  WRITE(*,*) ""
  WRITE(*,FMT)"ITER","Data(X)","Raw F(X)","Difference F(X)","Analytic F(X)","RESIDUAL"
  OPEN(10, FILE ='SecondBdiffOut.txt', STATUS='replace')

  ! Residual between two point is calculated
  H = (B-A)/N
  X = A
  I = 1
  DO WHILE (I .le. N)
    RAWF = F(X)
    RAWFS(I) = RAWF ! Save the value
    FX(I) = ((F(X+H)-(2*F(X))+F(X-H))/(H**2)) ! Second Center Difference is calculated
    XS(I) = X ! Save the value
    FA(I) = 6*XS(I)  ! Analytic Calculation of Second Difference
    RES(I) = abs(real(FX(I))-real(FA(I))) ! Residual Calculation
    WRITE(*,*) I,XS(I),RAWFS(I),FX(I),FA(I),RES(I)
    WRITE(10,*) I,XS(I),RAWFS(I),FX(I),FA(I),RES(I)
    X = X + H
    I = I + 1
  END DO
END PROGRAM

REAL FUNCTION F(X)
  IMPLICIT NONE
  REAL :: X
  F = X**3
END FUNCTION
