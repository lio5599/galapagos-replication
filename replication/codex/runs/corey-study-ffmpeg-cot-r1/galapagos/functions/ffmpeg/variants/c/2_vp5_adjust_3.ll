; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/2_vp5_adjust_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/2_vp5_adjust_3.c"
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
  %1 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp sle i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %2
  store i32 %mul, ptr %r, align 4
  %3 = load i32, ptr %negative, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %4 = load i32, ptr %r, align 4
  %sub = sub nsw i32 0, %4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %5 = load i32, ptr %r, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %5, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32, ptr %negative, align 4
  %tobool3 = icmp ne i32 %6, 0
  br i1 %tobool3, label %cond.true4, label %cond.false6

cond.true4:                                       ; preds = %if.end
  %7 = load i32, ptr %v.addr, align 4
  %sub5 = sub nsw i32 0, %7
  br label %cond.end7

cond.false6:                                      ; preds = %if.end
  %8 = load i32, ptr %v.addr, align 4
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.true4
  %cond8 = phi i32 [ %sub5, %cond.true4 ], [ %8, %cond.false6 ]
  store i32 %cond8, ptr %a, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %t.addr, align 4
  %cmp9 = icmp sle i32 %9, %10
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %cond.end7
  %11 = load i32, ptr %v.addr, align 4
  store i32 %11, ptr %retval, align 4
  br label %return

if.end12:                                         ; preds = %cond.end7
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %t.addr, align 4
  %mul13 = mul nsw i32 2, %13
  %cmp14 = icmp sge i32 %12, %mul13
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end12
  store i32 0, ptr %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end12
  %14 = load i32, ptr %t.addr, align 4
  %mul18 = mul nsw i32 2, %14
  %15 = load i32, ptr %a, align 4
  %sub19 = sub nsw i32 %mul18, %15
  store i32 %sub19, ptr %r, align 4
  %16 = load i32, ptr %negative, align 4
  %tobool20 = icmp ne i32 %16, 0
  br i1 %tobool20, label %cond.true21, label %cond.false23

cond.true21:                                      ; preds = %if.end17
  %17 = load i32, ptr %r, align 4
  %sub22 = sub nsw i32 0, %17
  br label %cond.end24

cond.false23:                                     ; preds = %if.end17
  %18 = load i32, ptr %r, align 4
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.true21
  %cond25 = phi i32 [ %sub22, %cond.true21 ], [ %18, %cond.false23 ]
  store i32 %cond25, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end24, %if.then16, %if.then11, %cond.end
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
