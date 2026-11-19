; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r2/functions/ffmpeg/variants/c/2_vp5_adjust_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r2/functions/ffmpeg/variants/c/2_vp5_adjust_3.c"
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
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %2, %cond.false ]
  store i32 %cond, ptr %magnitude, align 4
  %3 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp sle i32 %3, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %4 = load i32, ptr %t.addr, align 4
  %5 = load i32, ptr %t.addr, align 4
  %add = add nsw i32 %4, %5
  store i32 %add, ptr %result, align 4
  br label %if.end11

if.else:                                          ; preds = %cond.end
  %6 = load i32, ptr %magnitude, align 4
  %7 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %7
  %cmp2 = icmp sge i32 %6, %mul
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  %8 = load i32, ptr %magnitude, align 4
  %9 = load i32, ptr %t.addr, align 4
  %cmp4 = icmp sgt i32 %8, %9
  br i1 %cmp4, label %cond.true5, label %cond.false8

cond.true5:                                       ; preds = %if.end
  %10 = load i32, ptr %t.addr, align 4
  %mul6 = mul nsw i32 2, %10
  %11 = load i32, ptr %magnitude, align 4
  %sub7 = sub nsw i32 %mul6, %11
  br label %cond.end9

cond.false8:                                      ; preds = %if.end
  %12 = load i32, ptr %magnitude, align 4
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false8, %cond.true5
  %cond10 = phi i32 [ %sub7, %cond.true5 ], [ %12, %cond.false8 ]
  store i32 %cond10, ptr %result, align 4
  br label %if.end11

if.end11:                                         ; preds = %cond.end9, %if.then
  %13 = load i32, ptr %v.addr, align 4
  %cmp12 = icmp slt i32 %13, 0
  br i1 %cmp12, label %cond.true13, label %cond.false15

cond.true13:                                      ; preds = %if.end11
  %14 = load i32, ptr %result, align 4
  %sub14 = sub nsw i32 0, %14
  br label %cond.end16

cond.false15:                                     ; preds = %if.end11
  %15 = load i32, ptr %result, align 4
  br label %cond.end16

cond.end16:                                       ; preds = %cond.false15, %cond.true13
  %cond17 = phi i32 [ %sub14, %cond.true13 ], [ %15, %cond.false15 ]
  store i32 %cond17, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end16, %if.then3
  %16 = load i32, ptr %retval, align 4
  ret i32 %16
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
