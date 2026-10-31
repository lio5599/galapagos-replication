; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_7.c"
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
  %a = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  store i32 %0, ptr %a, align 4
  %1 = load i32, ptr %a, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %a, align 4
  %sub = sub nsw i32 0, %2
  store i32 %sub, ptr %a, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp slt i32 %3, %4
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %5 = load i32, ptr %a, align 4
  store i32 %5, ptr %r, align 4
  br label %if.end12

if.else:                                          ; preds = %if.end
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %7
  %cmp3 = icmp slt i32 %6, %mul
  br i1 %cmp3, label %if.then4, label %if.else7

if.then4:                                         ; preds = %if.else
  %8 = load i32, ptr %t.addr, align 4
  %mul5 = mul nsw i32 2, %8
  %9 = load i32, ptr %a, align 4
  %sub6 = sub nsw i32 %mul5, %9
  store i32 %sub6, ptr %r, align 4
  br label %if.end11

if.else7:                                         ; preds = %if.else
  %10 = load i32, ptr %t.addr, align 4
  %11 = load i32, ptr %t.addr, align 4
  %cmp8 = icmp slt i32 %11, 0
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else7
  %12 = load i32, ptr %t.addr, align 4
  %sub9 = sub nsw i32 0, %12
  br label %cond.end

cond.false:                                       ; preds = %if.else7
  %13 = load i32, ptr %t.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub9, %cond.true ], [ %13, %cond.false ]
  %sub10 = sub nsw i32 %10, %cond
  store i32 %sub10, ptr %r, align 4
  br label %if.end11

if.end11:                                         ; preds = %cond.end, %if.then4
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then2
  %14 = load i32, ptr %v.addr, align 4
  %cmp13 = icmp slt i32 %14, 0
  br i1 %cmp13, label %cond.true14, label %cond.false16

cond.true14:                                      ; preds = %if.end12
  %15 = load i32, ptr %r, align 4
  %sub15 = sub nsw i32 0, %15
  br label %cond.end17

cond.false16:                                     ; preds = %if.end12
  %16 = load i32, ptr %r, align 4
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false16, %cond.true14
  %cond18 = phi i32 [ %sub15, %cond.true14 ], [ %16, %cond.false16 ]
  ret i32 %cond18
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
