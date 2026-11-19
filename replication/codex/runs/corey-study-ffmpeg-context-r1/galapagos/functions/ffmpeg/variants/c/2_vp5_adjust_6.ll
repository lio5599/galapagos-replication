; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r1/functions/ffmpeg/variants/c/2_vp5_adjust_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r1/functions/ffmpeg/variants/c/2_vp5_adjust_6.c"
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
  %magnitude = alloca i32, align 4
  %twice = alloca i32, align 4
  %result = alloca i32, align 4
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
  store i32 %cond, ptr %magnitude, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  store i32 %mul, ptr %twice, align 4
  %5 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp sle i32 %5, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %6 = load i32, ptr %twice, align 4
  store i32 %6, ptr %result, align 4
  br label %if.end13

if.else:                                          ; preds = %cond.end
  %7 = load i32, ptr %magnitude, align 4
  %8 = load i32, ptr %twice, align 4
  %cmp3 = icmp sge i32 %7, %8
  br i1 %cmp3, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else
  store i32 0, ptr %result, align 4
  br label %if.end12

if.else6:                                         ; preds = %if.else
  %9 = load i32, ptr %magnitude, align 4
  %10 = load i32, ptr %t.addr, align 4
  %cmp7 = icmp sle i32 %9, %10
  br i1 %cmp7, label %if.then9, label %if.else10

if.then9:                                         ; preds = %if.else6
  %11 = load i32, ptr %magnitude, align 4
  store i32 %11, ptr %result, align 4
  br label %if.end

if.else10:                                        ; preds = %if.else6
  %12 = load i32, ptr %twice, align 4
  %13 = load i32, ptr %magnitude, align 4
  %sub11 = sub nsw i32 %12, %13
  store i32 %sub11, ptr %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then5
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then
  %14 = load i32, ptr %negative, align 4
  %tobool14 = icmp ne i32 %14, 0
  br i1 %tobool14, label %cond.true15, label %cond.false17

cond.true15:                                      ; preds = %if.end13
  %15 = load i32, ptr %result, align 4
  %sub16 = sub nsw i32 0, %15
  br label %cond.end18

cond.false17:                                     ; preds = %if.end13
  %16 = load i32, ptr %result, align 4
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false17, %cond.true15
  %cond19 = phi i32 [ %sub16, %cond.true15 ], [ %16, %cond.false17 ]
  ret i32 %cond19
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
