; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r2/functions/liboqs/variants/c/1_fpr_lt_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r2/functions/liboqs/variants/c/1_fpr_lt_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %mask = alloca i64, align 8
  %kx = alloca i64, align 8
  %ky = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  store i64 9223372036854775807, ptr %mask, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %mask, align 8
  %and = and i64 %0, %1
  store i64 %and, ptr %kx, align 8
  %2 = load i64, ptr %y.addr, align 8
  %3 = load i64, ptr %mask, align 8
  %and1 = and i64 %2, %3
  store i64 %and1, ptr %ky, align 8
  %4 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %4, 63
  %tobool = icmp ne i64 %shr, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i64, ptr %kx, align 8
  %sub = sub nsw i64 -1, %5
  store i64 %sub, ptr %kx, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i64, ptr %y.addr, align 8
  %shr2 = lshr i64 %6, 63
  %tobool3 = icmp ne i64 %shr2, 0
  br i1 %tobool3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %7 = load i64, ptr %ky, align 8
  %sub5 = sub nsw i64 -1, %7
  store i64 %sub5, ptr %ky, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %8 = load i64, ptr %kx, align 8
  %9 = load i64, ptr %ky, align 8
  %cmp = icmp slt i64 %8, %9
  %conv = zext i1 %cmp to i32
  ret i32 %conv
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
