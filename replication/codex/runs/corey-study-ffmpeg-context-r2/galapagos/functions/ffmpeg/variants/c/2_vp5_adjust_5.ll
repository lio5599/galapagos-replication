; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r2/functions/ffmpeg/variants/c/2_vp5_adjust_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r2/functions/ffmpeg/variants/c/2_vp5_adjust_5.c"
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
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %negative = alloca i32, align 4
  %a = alloca i32, align 4
  %twice = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %negative, align 4
  %1 = load i32, ptr %negative, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  store i32 %mul, ptr %twice, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %twice, align 4
  %cmp1 = icmp slt i32 %5, %6
  br i1 %cmp1, label %if.end, label %if.then

if.then:                                          ; preds = %cond.end
  store i32 0, ptr %a, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %t.addr, align 4
  %cmp3 = icmp sgt i32 %7, %8
  br i1 %cmp3, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %9 = load i32, ptr %twice, align 4
  %10 = load i32, ptr %a, align 4
  %sub6 = sub nsw i32 %9, %10
  store i32 %sub6, ptr %a, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %11 = load i32, ptr %negative, align 4
  %tobool8 = icmp ne i32 %11, 0
  br i1 %tobool8, label %cond.true9, label %cond.false11

cond.true9:                                       ; preds = %if.end7
  %12 = load i32, ptr %a, align 4
  %sub10 = sub nsw i32 0, %12
  br label %cond.end12

cond.false11:                                     ; preds = %if.end7
  %13 = load i32, ptr %a, align 4
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true9
  %cond13 = phi i32 [ %sub10, %cond.true9 ], [ %13, %cond.false11 ]
  ret i32 %cond13
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
