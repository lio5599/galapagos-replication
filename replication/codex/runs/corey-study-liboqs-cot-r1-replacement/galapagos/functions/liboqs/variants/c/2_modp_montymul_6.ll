; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-liboqs-cot-r1-replacement/functions/liboqs/variants/c/2_modp_montymul_6.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-liboqs-cot-r1-replacement/functions/liboqs/variants/c/2_modp_montymul_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @modp_montymul(i32 noundef %a, i32 noundef %b, i32 noundef %p, i32 noundef %p0i) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %p0i.addr = alloca i32, align 4
  %z = alloca i64, align 8
  %w = alloca i64, align 8
  %d = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  store i32 %p, ptr %p.addr, align 4
  store i32 %p0i, ptr %p0i.addr, align 4
  store i64 0, ptr %z, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %0, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %b.addr, align 4
  %2 = load i32, ptr %i, align 4
  %shr = lshr i32 %1, %2
  %and = and i32 %shr, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32, ptr %a.addr, align 4
  %conv = zext i32 %3 to i64
  %4 = load i32, ptr %i, align 4
  %sh_prom = zext i32 %4 to i64
  %shl = shl i64 %conv, %sh_prom
  %5 = load i64, ptr %z, align 8
  %add = add i64 %5, %shl
  store i64 %add, ptr %z, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, ptr %i, align 4
  %inc = add i32 %6, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %7 = load i64, ptr %z, align 8
  %8 = load i32, ptr %p0i.addr, align 4
  %conv1 = zext i32 %8 to i64
  %mul = mul i64 %7, %conv1
  %and2 = and i64 %mul, 2147483647
  %9 = load i32, ptr %p.addr, align 4
  %conv3 = zext i32 %9 to i64
  %mul4 = mul i64 %and2, %conv3
  store i64 %mul4, ptr %w, align 8
  %10 = load i64, ptr %z, align 8
  %11 = load i64, ptr %w, align 8
  %add5 = add i64 %10, %11
  %shr6 = lshr i64 %add5, 31
  %conv7 = trunc i64 %shr6 to i32
  %12 = load i32, ptr %p.addr, align 4
  %sub = sub i32 %conv7, %12
  store i32 %sub, ptr %d, align 4
  %13 = load i32, ptr %p.addr, align 4
  %14 = load i32, ptr %d, align 4
  %shr8 = lshr i32 %14, 31
  %sub9 = sub i32 0, %shr8
  %and10 = and i32 %13, %sub9
  %15 = load i32, ptr %d, align 4
  %add11 = add i32 %15, %and10
  store i32 %add11, ptr %d, align 4
  %16 = load i32, ptr %d, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @modp_montymul(i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 0)
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
