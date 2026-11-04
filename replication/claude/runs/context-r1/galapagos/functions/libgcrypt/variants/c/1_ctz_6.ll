; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %in.addr = alloca i64, align 8
  %y = alloca i64, align 8
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  %0 = load i64, ptr %in.addr, align 8
  %1 = load i64, ptr %in.addr, align 8
  %not = xor i64 %1, -1
  %add = add i64 %not, 1
  %and = and i64 %0, %add
  store i64 %and, ptr %y, align 8
  store i32 64, ptr %r, align 4
  %2 = load i64, ptr %y, align 8
  %tobool = icmp ne i64 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %r, align 4
  %sub = sub nsw i32 %3, 1
  store i32 %sub, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i64, ptr %y, align 8
  %and1 = and i64 %4, 4294967295
  %tobool2 = icmp ne i64 %and1, 0
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %5 = load i32, ptr %r, align 4
  %sub4 = sub nsw i32 %5, 32
  store i32 %sub4, ptr %r, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %6 = load i64, ptr %y, align 8
  %and6 = and i64 %6, 281470681808895
  %tobool7 = icmp ne i64 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end5
  %7 = load i32, ptr %r, align 4
  %sub9 = sub nsw i32 %7, 16
  store i32 %sub9, ptr %r, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end5
  %8 = load i64, ptr %y, align 8
  %and11 = and i64 %8, 71777214294589695
  %tobool12 = icmp ne i64 %and11, 0
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %9 = load i32, ptr %r, align 4
  %sub14 = sub nsw i32 %9, 8
  store i32 %sub14, ptr %r, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end10
  %10 = load i64, ptr %y, align 8
  %and16 = and i64 %10, 1085102592571150095
  %tobool17 = icmp ne i64 %and16, 0
  br i1 %tobool17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.end15
  %11 = load i32, ptr %r, align 4
  %sub19 = sub nsw i32 %11, 4
  store i32 %sub19, ptr %r, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end15
  %12 = load i64, ptr %y, align 8
  %and21 = and i64 %12, 3689348814741910323
  %tobool22 = icmp ne i64 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %if.end20
  %13 = load i32, ptr %r, align 4
  %sub24 = sub nsw i32 %13, 2
  store i32 %sub24, ptr %r, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %if.end20
  %14 = load i64, ptr %y, align 8
  %and26 = and i64 %14, 6148914691236517205
  %tobool27 = icmp ne i64 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end25
  %15 = load i32, ptr %r, align 4
  %sub29 = sub nsw i32 %15, 1
  store i32 %sub29, ptr %r, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end25
  %16 = load i32, ptr %r, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
