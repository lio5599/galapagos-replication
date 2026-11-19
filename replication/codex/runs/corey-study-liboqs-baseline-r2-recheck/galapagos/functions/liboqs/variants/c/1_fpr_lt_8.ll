; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r2-recheck/functions/liboqs/variants/c/1_fpr_lt_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r2-recheck/functions/liboqs/variants/c/1_fpr_lt_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %magnitude = alloca i64, align 8
  %mx = alloca i64, align 8
  %my = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  store i64 9223372036854775807, ptr %magnitude, align 8
  %0 = load i64, ptr %x.addr, align 8
  %and = and i64 %0, 9223372036854775807
  store i64 %and, ptr %mx, align 8
  %1 = load i64, ptr %y.addr, align 8
  %and1 = and i64 %1, 9223372036854775807
  store i64 %and1, ptr %my, align 8
  %2 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %2, 63
  %tobool = icmp ne i64 %shr, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i64, ptr %y.addr, align 8
  %shr2 = lshr i64 %3, 63
  %tobool3 = icmp ne i64 %shr2, 0
  br i1 %tobool3, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %if.then
  %4 = load i64, ptr %mx, align 8
  %5 = load i64, ptr %my, align 8
  %cmp = icmp ugt i64 %4, %5
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then
  %6 = phi i1 [ true, %if.then ], [ %cmp, %lor.rhs ]
  %lor.ext = zext i1 %6 to i32
  store i32 %lor.ext, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %7 = load i64, ptr %y.addr, align 8
  %shr4 = lshr i64 %7, 63
  %tobool5 = icmp ne i64 %shr4, 0
  br i1 %tobool5, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.end
  %8 = load i64, ptr %mx, align 8
  %9 = load i64, ptr %my, align 8
  %cmp6 = icmp ult i64 %8, %9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %10 = phi i1 [ false, %if.end ], [ %cmp6, %land.rhs ]
  %land.ext = zext i1 %10 to i32
  store i32 %land.ext, ptr %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %lor.end
  %11 = load i32, ptr %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @fpr_lt(i64 noundef 0, i64 noundef 0)
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
