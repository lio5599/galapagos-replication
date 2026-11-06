; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/2_BitInterleave_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/2_BitInterleave_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @BitInterleave(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @BitInterleave(i64 noundef %Ai) #0 {
entry:
  %Ai.addr = alloca i64, align 8
  %t = alloca i64, align 8
  %r = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %Ai, ptr %Ai.addr, align 8
  store i64 0, ptr %t, align 8
  store i64 0, ptr %r, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, ptr %Ai.addr, align 8
  %2 = load i32, ptr %i, align 4
  %mul = mul nsw i32 8, %2
  %sh_prom = zext i32 %mul to i64
  %shr = lshr i64 %1, %sh_prom
  %and = and i64 %shr, 255
  %3 = load i32, ptr %i, align 4
  %sub = sub nsw i32 7, %3
  %mul1 = mul nsw i32 8, %sub
  %sh_prom2 = zext i32 %mul1 to i64
  %shl = shl i64 %and, %sh_prom2
  %4 = load i64, ptr %t, align 8
  %or = or i64 %4, %shl
  store i64 %or, ptr %t, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc15, %for.end
  %6 = load i32, ptr %i, align 4
  %cmp4 = icmp slt i32 %6, 8
  br i1 %cmp4, label %for.body5, label %for.end17

for.body5:                                        ; preds = %for.cond3
  %7 = load i64, ptr %t, align 8
  %8 = load i32, ptr %i, align 4
  %mul6 = mul nsw i32 8, %8
  %sh_prom7 = zext i32 %mul6 to i64
  %shr8 = lshr i64 %7, %sh_prom7
  %and9 = and i64 %shr8, 255
  %9 = load i32, ptr %i, align 4
  %sub10 = sub nsw i32 7, %9
  %mul11 = mul nsw i32 8, %sub10
  %sh_prom12 = zext i32 %mul11 to i64
  %shl13 = shl i64 %and9, %sh_prom12
  %10 = load i64, ptr %r, align 8
  %or14 = or i64 %10, %shl13
  store i64 %or14, ptr %r, align 8
  br label %for.inc15

for.inc15:                                        ; preds = %for.body5
  %11 = load i32, ptr %i, align 4
  %inc16 = add nsw i32 %11, 1
  store i32 %inc16, ptr %i, align 4
  br label %for.cond3, !llvm.loop !8

for.end17:                                        ; preds = %for.cond3
  %12 = load i64, ptr %r, align 8
  ret i64 %12
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
