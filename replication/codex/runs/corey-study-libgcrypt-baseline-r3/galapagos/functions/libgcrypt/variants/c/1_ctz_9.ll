; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r3/functions/libgcrypt/variants/c/1_ctz_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r3/functions/libgcrypt/variants/c/1_ctz_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %isolated = alloca i64, align 8
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  %0 = load i64, ptr %in.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 64, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64, ptr %in.addr, align 8
  %2 = load i64, ptr %in.addr, align 8
  %sub = sub i64 0, %2
  %and = and i64 %1, %sub
  store i64 %and, ptr %isolated, align 8
  %3 = load i64, ptr %isolated, align 8
  %and1 = and i64 %3, -6148914691236517206
  %tobool = icmp ne i64 %and1, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %4 = load i32, ptr %r, align 4
  %add = add nsw i32 %4, 1
  store i32 %add, ptr %r, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %5 = load i64, ptr %isolated, align 8
  %and4 = and i64 %5, -3689348814741910324
  %tobool5 = icmp ne i64 %and4, 0
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end3
  %6 = load i32, ptr %r, align 4
  %add7 = add nsw i32 %6, 2
  store i32 %add7, ptr %r, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end3
  %7 = load i64, ptr %isolated, align 8
  %and9 = and i64 %7, -1085102592571150096
  %tobool10 = icmp ne i64 %and9, 0
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end8
  %8 = load i32, ptr %r, align 4
  %add12 = add nsw i32 %8, 4
  store i32 %add12, ptr %r, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end8
  %9 = load i64, ptr %isolated, align 8
  %and14 = and i64 %9, -71777214294589696
  %tobool15 = icmp ne i64 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end13
  %10 = load i32, ptr %r, align 4
  %add17 = add nsw i32 %10, 8
  store i32 %add17, ptr %r, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end13
  %11 = load i64, ptr %isolated, align 8
  %and19 = and i64 %11, -281470681808896
  %tobool20 = icmp ne i64 %and19, 0
  br i1 %tobool20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end18
  %12 = load i32, ptr %r, align 4
  %add22 = add nsw i32 %12, 16
  store i32 %add22, ptr %r, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end18
  %13 = load i64, ptr %isolated, align 8
  %and24 = and i64 %13, -4294967296
  %tobool25 = icmp ne i64 %and24, 0
  br i1 %tobool25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %if.end23
  %14 = load i32, ptr %r, align 4
  %add27 = add nsw i32 %14, 32
  store i32 %add27, ptr %r, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %if.end23
  %15 = load i32, ptr %r, align 4
  store i32 %15, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end28, %if.then
  %16 = load i32, ptr %retval, align 4
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
