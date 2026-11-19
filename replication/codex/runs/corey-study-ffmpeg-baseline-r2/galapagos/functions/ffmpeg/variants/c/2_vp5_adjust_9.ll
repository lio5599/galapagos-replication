; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r2/functions/ffmpeg/variants/c/2_vp5_adjust_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r2/functions/ffmpeg/variants/c/2_vp5_adjust_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @vp5_adjust(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @vp5_adjust(i32 noundef %v, i32 noundef %t) #0 {
entry:
  %retval = alloca i32, align 4
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end10

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, ptr %magnitude, align 4
  %2 = load i32, ptr %magnitude, align 4
  %3 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %3
  %cmp1 = icmp sge i32 %2, %mul
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 0, ptr %magnitude, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %4 = load i32, ptr %magnitude, align 4
  %5 = load i32, ptr %t.addr, align 4
  %sub3 = sub nsw i32 %4, %5
  store i32 %sub3, ptr %result, align 4
  %6 = load i32, ptr %result, align 4
  %cmp4 = icmp slt i32 %6, 0
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %7 = load i32, ptr %result, align 4
  %sub6 = sub nsw i32 0, %7
  store i32 %sub6, ptr %result, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %8 = load i32, ptr %t.addr, align 4
  %9 = load i32, ptr %result, align 4
  %sub8 = sub nsw i32 %8, %9
  %sub9 = sub nsw i32 0, %sub8
  store i32 %sub9, ptr %retval, align 4
  br label %return

if.end10:                                         ; preds = %entry
  %10 = load i32, ptr %v.addr, align 4
  %11 = load i32, ptr %t.addr, align 4
  %mul11 = mul nsw i32 2, %11
  %cmp12 = icmp slt i32 %10, %mul11
  br i1 %cmp12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end10
  %12 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %12, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, ptr %magnitude, align 4
  %13 = load i32, ptr %magnitude, align 4
  %14 = load i32, ptr %t.addr, align 4
  %sub13 = sub nsw i32 %13, %14
  store i32 %sub13, ptr %result, align 4
  %15 = load i32, ptr %result, align 4
  %cmp14 = icmp slt i32 %15, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %cond.end
  %16 = load i32, ptr %t.addr, align 4
  %17 = load i32, ptr %result, align 4
  %add = add nsw i32 %16, %17
  store i32 %add, ptr %retval, align 4
  br label %return

if.end16:                                         ; preds = %cond.end
  %18 = load i32, ptr %t.addr, align 4
  %19 = load i32, ptr %result, align 4
  %sub17 = sub nsw i32 %18, %19
  store i32 %sub17, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end16, %if.then15, %if.end7
  %20 = load i32, ptr %retval, align 4
  ret i32 %20
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
