; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r2/functions/libgcrypt/variants/c/0_barrett_reduce_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r2/functions/libgcrypt/variants/c/0_barrett_reduce_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %n = alloca i32, align 4
  %t = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  %mul = mul nsw i32 20159, %conv
  %add = add nsw i32 %mul, 33554432
  store i32 %add, ptr %n, align 4
  %1 = load i32, ptr %n, align 4
  %div = sdiv i32 %1, 67108864
  store i32 %div, ptr %t, align 4
  %2 = load i32, ptr %n, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %3 = load i32, ptr %n, align 4
  %rem = srem i32 %3, 67108864
  %cmp2 = icmp ne i32 %rem, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %cmp2, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  %5 = load i32, ptr %t, align 4
  %sub = sub nsw i32 %5, %land.ext
  store i32 %sub, ptr %t, align 4
  %6 = load i16, ptr %a.addr, align 2
  %conv4 = sext i16 %6 to i32
  %7 = load i32, ptr %t, align 4
  %mul5 = mul nsw i32 %7, 3329
  %sub6 = sub nsw i32 %conv4, %mul5
  %conv7 = trunc i32 %sub6 to i16
  ret i16 %conv7
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
