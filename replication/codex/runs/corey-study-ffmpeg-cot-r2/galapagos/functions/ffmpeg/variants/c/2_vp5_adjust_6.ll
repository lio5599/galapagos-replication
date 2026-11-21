; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/2_vp5_adjust_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/2_vp5_adjust_6.c"
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
  %negative = alloca i32, align 4
  %a = alloca i32, align 4
  %r = alloca i32, align 4
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
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp sle i32 %4, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %6 = load i32, ptr %v.addr, align 4
  store i32 %6, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %8
  %cmp3 = icmp slt i32 %7, %mul
  br i1 %cmp3, label %if.then5, label %if.end14

if.then5:                                         ; preds = %if.end
  %9 = load i32, ptr %t.addr, align 4
  %mul6 = mul nsw i32 2, %9
  %10 = load i32, ptr %a, align 4
  %sub7 = sub nsw i32 %mul6, %10
  store i32 %sub7, ptr %r, align 4
  %11 = load i32, ptr %negative, align 4
  %tobool8 = icmp ne i32 %11, 0
  br i1 %tobool8, label %cond.true9, label %cond.false11

cond.true9:                                       ; preds = %if.then5
  %12 = load i32, ptr %r, align 4
  %sub10 = sub nsw i32 0, %12
  br label %cond.end12

cond.false11:                                     ; preds = %if.then5
  %13 = load i32, ptr %r, align 4
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true9
  %cond13 = phi i32 [ %sub10, %cond.true9 ], [ %13, %cond.false11 ]
  store i32 %cond13, ptr %retval, align 4
  br label %return

if.end14:                                         ; preds = %if.end
  %14 = load i32, ptr %t.addr, align 4
  %cmp15 = icmp slt i32 %14, 0
  br i1 %cmp15, label %cond.true17, label %cond.false19

cond.true17:                                      ; preds = %if.end14
  %15 = load i32, ptr %t.addr, align 4
  %mul18 = mul nsw i32 2, %15
  br label %cond.end20

cond.false19:                                     ; preds = %if.end14
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false19, %cond.true17
  %cond21 = phi i32 [ %mul18, %cond.true17 ], [ 0, %cond.false19 ]
  store i32 %cond21, ptr %r, align 4
  %16 = load i32, ptr %negative, align 4
  %tobool22 = icmp ne i32 %16, 0
  br i1 %tobool22, label %cond.true23, label %cond.false25

cond.true23:                                      ; preds = %cond.end20
  %17 = load i32, ptr %r, align 4
  %sub24 = sub nsw i32 0, %17
  br label %cond.end26

cond.false25:                                     ; preds = %cond.end20
  %18 = load i32, ptr %r, align 4
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false25, %cond.true23
  %cond27 = phi i32 [ %sub24, %cond.true23 ], [ %18, %cond.false25 ]
  store i32 %cond27, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end26, %cond.end12, %if.then
  %19 = load i32, ptr %retval, align 4
  ret i32 %19
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
