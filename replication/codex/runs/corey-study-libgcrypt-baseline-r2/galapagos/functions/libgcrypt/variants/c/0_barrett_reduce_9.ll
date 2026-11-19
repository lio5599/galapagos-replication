; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r2/functions/libgcrypt/variants/c/0_barrett_reduce_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r2/functions/libgcrypt/variants/c/0_barrett_reduce_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %magnitude = alloca i32, align 4
  %q = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i16, ptr %a.addr, align 2
  %conv2 = sext i16 %1 to i32
  %sub = sub nsw i32 0, %conv2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i16, ptr %a.addr, align 2
  %conv3 = sext i16 %2 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %conv3, %cond.false ]
  store i32 %cond, ptr %magnitude, align 4
  %3 = load i32, ptr %magnitude, align 4
  %add = add nsw i32 %3, 1664
  %div = sdiv i32 %add, 3329
  store i32 %div, ptr %q, align 4
  %4 = load i16, ptr %a.addr, align 2
  %conv4 = sext i16 %4 to i32
  %cmp5 = icmp slt i32 %conv4, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %5 = load i32, ptr %q, align 4
  %sub7 = sub nsw i32 0, %5
  store i32 %sub7, ptr %q, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %6 = load i16, ptr %a.addr, align 2
  %conv8 = sext i16 %6 to i32
  %7 = load i32, ptr %q, align 4
  %mul = mul nsw i32 %7, 3329
  %sub9 = sub nsw i32 %conv8, %mul
  %conv10 = trunc i32 %sub9 to i16
  ret i16 %conv10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call signext i16 @barrett_reduce(i16 noundef signext 0)
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
