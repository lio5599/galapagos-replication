; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context_cot-r2/functions/ffmpeg/variants/c/2_vp5_adjust_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context_cot-r2/functions/ffmpeg/variants/c/2_vp5_adjust_5.c"
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
  %twice = alloca i32, align 4
  %a = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %0
  store i32 %mul, ptr %twice, align 4
  %1 = load i32, ptr %t.addr, align 4
  %cmp = icmp sle i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  %cmp1 = icmp slt i32 %2, 0
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %3 = load i32, ptr %twice, align 4
  %sub = sub nsw i32 0, %3
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %4 = load i32, ptr %twice, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %4, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i32, ptr %v.addr, align 4
  %cmp2 = icmp slt i32 %5, 0
  br i1 %cmp2, label %cond.true3, label %cond.false5

cond.true3:                                       ; preds = %if.end
  %6 = load i32, ptr %v.addr, align 4
  %sub4 = sub nsw i32 0, %6
  br label %cond.end6

cond.false5:                                      ; preds = %if.end
  %7 = load i32, ptr %v.addr, align 4
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false5, %cond.true3
  %cond7 = phi i32 [ %sub4, %cond.true3 ], [ %7, %cond.false5 ]
  store i32 %cond7, ptr %a, align 4
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %twice, align 4
  %cmp8 = icmp sge i32 %8, %9
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %cond.end6
  store i32 0, ptr %retval, align 4
  br label %return

if.end10:                                         ; preds = %cond.end6
  %10 = load i32, ptr %a, align 4
  %11 = load i32, ptr %t.addr, align 4
  %cmp11 = icmp sle i32 %10, %11
  br i1 %cmp11, label %cond.true12, label %cond.false13

cond.true12:                                      ; preds = %if.end10
  %12 = load i32, ptr %a, align 4
  br label %cond.end15

cond.false13:                                     ; preds = %if.end10
  %13 = load i32, ptr %twice, align 4
  %14 = load i32, ptr %a, align 4
  %sub14 = sub nsw i32 %13, %14
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false13, %cond.true12
  %cond16 = phi i32 [ %12, %cond.true12 ], [ %sub14, %cond.false13 ]
  store i32 %cond16, ptr %r, align 4
  %15 = load i32, ptr %v.addr, align 4
  %cmp17 = icmp slt i32 %15, 0
  br i1 %cmp17, label %cond.true18, label %cond.false20

cond.true18:                                      ; preds = %cond.end15
  %16 = load i32, ptr %r, align 4
  %sub19 = sub nsw i32 0, %16
  br label %cond.end21

cond.false20:                                     ; preds = %cond.end15
  %17 = load i32, ptr %r, align 4
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true18
  %cond22 = phi i32 [ %sub19, %cond.true18 ], [ %17, %cond.false20 ]
  store i32 %cond22, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end21, %if.then9, %cond.end
  %18 = load i32, ptr %retval, align 4
  ret i32 %18
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
