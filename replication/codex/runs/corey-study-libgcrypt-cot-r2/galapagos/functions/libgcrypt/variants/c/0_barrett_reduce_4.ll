; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r2/functions/libgcrypt/variants/c/0_barrett_reduce_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r2/functions/libgcrypt/variants/c/0_barrett_reduce_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %n = alloca i64, align 8
  %q = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i64
  %mul = mul nsw i64 20159, %conv
  %add = add nsw i64 %mul, 33554432
  store i64 %add, ptr %n, align 8
  %1 = load i64, ptr %n, align 8
  %cmp = icmp sge i64 %1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i64, ptr %n, align 8
  %div = sdiv i64 %2, 67108864
  %conv2 = trunc i64 %div to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i64, ptr %n, align 8
  %sub = sub nsw i64 0, %3
  %add3 = add nsw i64 %sub, 67108863
  %div4 = sdiv i64 %add3, 67108864
  %sub5 = sub nsw i64 0, %div4
  %conv6 = trunc i64 %sub5 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv2, %cond.true ], [ %conv6, %cond.false ]
  store i32 %cond, ptr %q, align 4
  %4 = load i16, ptr %a.addr, align 2
  %conv7 = sext i16 %4 to i32
  %5 = load i32, ptr %q, align 4
  %mul8 = mul nsw i32 %5, 3329
  %sub9 = sub nsw i32 %conv7, %mul8
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
